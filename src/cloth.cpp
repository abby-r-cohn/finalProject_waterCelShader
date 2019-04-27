#include <iostream>
#include <math.h>
#include <random>
#include <vector>

#include "cloth.h"
#include "collision/plane.h"
#include "collision/sphere.h"

using namespace std;

Cloth::Cloth(double width, double height, int num_width_points,
             int num_height_points, float thickness) {
  this->width = width;
  this->height = height;
  this->num_width_points = num_width_points;
  this->num_height_points = num_height_points;
  this->thickness = thickness;

  buildGrid();
  buildClothMesh();
}

Cloth::~Cloth() {
  point_masses.clear();
  springs.clear();

  if (clothMesh) {
    delete clothMesh;
  }
}

void Cloth::buildGrid() {
  // TODO (Part 1): Build a grid of masses and springs.
    for (int i = 0; i < num_width_points; i++) {
        for (int j = 0; j < num_height_points; j++) {
            Vector3D point = Vector3D(0, 0, 0);
            if (orientation == HORIZONTAL) {
                point.y = 1.0;
                float offset_x = width / num_width_points;
                float offset_y = height / num_height_points;
                point.x = i * offset_x;
                point.z = j * offset_y;
            } else {
                double random = (double)rand() / (double)RAND_MAX;
                random = random * (0.001 + 0.001) - 0.001;
                point.z = random;
                float offset_x = width / num_width_points;
                float offset_y = height / num_height_points;
                point.x = i * offset_x;
                point.y = j * offset_y;
            }
            bool tf = false;
            for (int k = 0; k < pinned.size(); k++) {
                float xp = pinned[k][0];
                float yp = pinned[k][1];
                if (xp == i && yp == j) {
                    tf = true;
                }
            }
             PointMass currPoint = PointMass(point, tf);
             point_masses.push_back(currPoint);
        }
    }
    
//    for (int k = 0; k < pinned.size(); k++) {
//        float xp = pinned[k][0];
//        float yp = pinned[k][1];
//        point_masses[yp*num_width_points + xp].pinned = true;
//    }
    
    for (int x = 0; x < num_width_points; x++) {
        for (int y = 0; y < num_height_points; y++) {

            if (x-1 >= 0 && y >= 0 && x-1 < num_width_points && y < num_height_points) {
                Spring struct_spring_left = Spring(&point_masses[num_width_points * y + x], &point_masses[num_width_points * y + (x-1)], STRUCTURAL);
                springs.push_back(struct_spring_left);
            }
            if (x >= 0 && y-1 >= 0 && x <num_width_points && y-1 < num_height_points) {
                Spring struct_spring_up = Spring(&point_masses[num_width_points * y + x], &point_masses[num_width_points * (y-1) + x], STRUCTURAL);
                springs.push_back(struct_spring_up);
            }
            //Structural constraints exist between a point mass and the point mass to its left as well as the point mass above it.
            if (x-1 >= 0 && y-1 >= 0 && x-1 < num_width_points && y-1 < num_height_points) {
                Spring shear_left = Spring(&point_masses[num_width_points * y + x], &point_masses[num_width_points * (y-1) + (x-1)], SHEARING);
                springs.push_back(shear_left);
            } if (x+1 >= 0 && y-1 >= 0 && x+1 < num_width_points && y-1 < num_height_points) {
                Spring shear_right = Spring(&point_masses[num_width_points * y + x], &point_masses[num_width_points * (y-1) + (x+1)], SHEARING);
                springs.push_back(shear_right);
            }
            //Shearing constraints exist between a point mass and the point mass to its diagonal upper left as well as the point mass to its diagonal upper right.
            if (x-2 >=0 && y >= 0 && x-2 < num_width_points && y < num_height_points) {
                Spring bend_left = Spring(&point_masses[num_width_points * y + x], &point_masses[num_width_points * y + (x-2)], BENDING);
                springs.push_back(bend_left);
            } if (x >= 0 && y-2 >= 0 && x < num_width_points && y-2 < num_height_points) {
                Spring bend_up = Spring(&point_masses[num_width_points * y + x], &point_masses[num_width_points * (y-2) + x], BENDING);
                springs.push_back(bend_up);
            }
            //Bending constraints exist between a point mass and the point mass two away to its left as well as the point mass two above it.
        }
    }
}

void Cloth::simulate(double frames_per_sec, double simulation_steps, ClothParameters *cp,
                     vector<Vector3D> external_accelerations,
                     vector<CollisionObject *> *collision_objects) {
  double mass = width * height * cp->density / num_width_points / num_height_points;
  double delta_t = 1.0f / frames_per_sec / simulation_steps;

//   TODO (Part 2): Compute total force acting on each point mass.

    Vector3D force_storage = Vector3D(0, 0, 0);
    for (Vector3D &acc:external_accelerations) {
        force_storage += acc;
    }
    force_storage *= mass;

    for (PointMass &pm:point_masses) {
            pm.forces = force_storage;
    }

    for (Spring &sp : springs) {
        if (cp->enable_structural_constraints && sp.spring_type == STRUCTURAL) {
            Vector3D force_vec = sp.pm_b->position - sp.pm_a->position;
            double fvn = force_vec.norm();
            force_vec.normalize();
            Vector3D fs = cp->ks * (fvn - sp.rest_length) * force_vec;
            sp.pm_a->forces += fs;
            sp.pm_b->forces += -fs;
        }
        if(cp->enable_shearing_constraints && sp.spring_type == SHEARING) {
            Vector3D force_vec = sp.pm_b->position - sp.pm_a->position;
            double fvn = force_vec.norm();
            force_vec.normalize();
            Vector3D fs = cp->ks * (fvn - sp.rest_length) * force_vec;
            sp.pm_a->forces += fs;
            sp.pm_b->forces += -fs;
        }
        if (cp->enable_bending_constraints && sp.spring_type == BENDING) {
            Vector3D force_vec = sp.pm_b->position - sp.pm_a->position;
            double fvn = force_vec.norm();
            force_vec.normalize();
            Vector3D fs = (cp->ks * 0.2) * (fvn - sp.rest_length) * force_vec;
            sp.pm_a->forces += fs;
            sp.pm_b->forces += -fs;
        }
    }
  // TODO (Part 2): Use Verlet integration to compute new point mass positions

    for (PointMass &pm:point_masses) {
        if (!pm.pinned) {
            Vector3D pos_updated = pm.position + (1.0 - (cp->damping/100.0)) * (pm.position - pm.last_position) + (pm.forces/mass) * pow(delta_t, 2);
            pm.last_position = pm.position;
            pm.position = pos_updated;
        }
    }

    
  // TODO (Part 4): Handle self-collisions.
    build_spatial_map();
     for (PointMass &pm:point_masses) {
         self_collide(pm, simulation_steps);
     }

  // TODO (Part 3): Handle collisions with other primitives.
    for (PointMass &pm:point_masses) {
        for (CollisionObject *coll:*collision_objects) {
            coll->collide(pm);
        }
    }

  // TODO (Part 2): Constrain the changes to be such that the spring does not change
  // in length more than 10% per timestep [Provot 1995].
    
    for (Spring &sp:springs) {
        Vector3D length = sp.pm_b->position - sp.pm_a->position;
        double added_dist = (double)length.norm() - sp.rest_length * 1.1;
        length.unit();
        if (((double)length.norm() - sp.rest_length * 1.1) > 0) {
            if (!sp.pm_a->pinned && !sp.pm_b->pinned) {
                added_dist /= 2.0;
                sp.pm_a->position += (added_dist * length);
                sp.pm_b->position -= (added_dist * length);
            }
            if (!sp.pm_a->pinned && sp.pm_b->pinned) {
                sp.pm_a->position += (added_dist * length);
            }
            if (sp.pm_a->pinned && !sp.pm_b->pinned) {
                sp.pm_b->position -= (added_dist * length);
            }
        }
    }
    
}

void Cloth::build_spatial_map() {
  for (const auto &entry : map) {
    delete(entry.second);
  }
  map.clear();

  // TODO (Part 4): Build a spatial map out of all of the point masses.
    for (PointMass &pm: point_masses) {
        float hash_key = hash_position(pm.position);
        if (map[hash_key] == NULL) {
            map[hash_key] = new std::vector<PointMass*>();
        }
        map[hash_key]->push_back(&pm);
    }
}

void Cloth::self_collide(PointMass &pm, double simulation_steps) {
  // TODO (Part 4): Handle self-collision for a given point mass.
    float hash_key = hash_position(pm.position);
    Vector3D total_correction = Vector3D(0, 0, 0);
    int counter = 0;
    if (!(map[hash_key] == NULL)) {
        for (PointMass *pm2 : *map[hash_key]) {
            Vector3D distance = pm2->position - pm.position;
            if (!(&pm2->position == &pm.position)) {
                if (distance.norm() < (2.0 * thickness)) {
                    Vector3D correction = pm.position - pm2->position;
                    correction.normalize();
                    correction *= 2.0 * thickness - distance.norm();
                    total_correction += correction;
                     counter += 1;
                }
            }
        }
    }
    if (counter > 0) {
    total_correction /= counter;
    total_correction /= simulation_steps;
    pm.position += total_correction;
    }
}

float Cloth::hash_position(Vector3D pos) {
  // TODO (Part 4): Hash a 3D position into a unique float identifier that represents membership in some 3D box volume.
    float w = 3.0 * width / num_width_points;
    float h = 3.0 * height / num_height_points;
    float t = max(w, h);
    float x = floor(pos.x / w);
    float y = floor(pos.y / h);
    float z = floor(pos.z / t);
    float hash2 = (113 * x) + (pow(113, 2) * y) + (pow(113, 3) * z);

    return hash2;
}

///////////////////////////////////////////////////////
/// YOU DO NOT NEED TO REFER TO ANY CODE BELOW THIS ///
///////////////////////////////////////////////////////

void Cloth::reset() {
  PointMass *pm = &point_masses[0];
  for (int i = 0; i < point_masses.size(); i++) {
    pm->position = pm->start_position;
    pm->last_position = pm->start_position;
    pm++;
  }
}

void Cloth::buildClothMesh() {
  if (point_masses.size() == 0) return;

  ClothMesh *clothMesh = new ClothMesh();
  vector<Triangle *> triangles;

  // Create vector of triangles
  for (int y = 0; y < num_height_points - 1; y++) {
    for (int x = 0; x < num_width_points - 1; x++) {
      PointMass *pm = &point_masses[y * num_width_points + x];
      // Get neighboring point masses:
      /*                      *
       * pm_A -------- pm_B   *
       *             /        *
       *  |         /   |     *
       *  |        /    |     *
       *  |       /     |     *
       *  |      /      |     *
       *  |     /       |     *
       *  |    /        |     *
       *      /               *
       * pm_C -------- pm_D   *
       *                      *
       */
      
      float u_min = x;
      u_min /= num_width_points - 1;
      float u_max = x + 1;
      u_max /= num_width_points - 1;
      float v_min = y;
      v_min /= num_height_points - 1;
      float v_max = y + 1;
      v_max /= num_height_points - 1;
      
      PointMass *pm_A = pm                       ;
      PointMass *pm_B = pm                    + 1;
      PointMass *pm_C = pm + num_width_points    ;
      PointMass *pm_D = pm + num_width_points + 1;
      
      Vector3D uv_A = Vector3D(u_min, v_min, 0);
      Vector3D uv_B = Vector3D(u_max, v_min, 0);
      Vector3D uv_C = Vector3D(u_min, v_max, 0);
      Vector3D uv_D = Vector3D(u_max, v_max, 0);
      
      
      // Both triangles defined by vertices in counter-clockwise orientation
      triangles.push_back(new Triangle(pm_A, pm_C, pm_B, 
                                       uv_A, uv_C, uv_B));
      triangles.push_back(new Triangle(pm_B, pm_C, pm_D, 
                                       uv_B, uv_C, uv_D));
    }
  }

  // For each triangle in row-order, create 3 edges and 3 internal halfedges
  for (int i = 0; i < triangles.size(); i++) {
    Triangle *t = triangles[i];

    // Allocate new halfedges on heap
    Halfedge *h1 = new Halfedge();
    Halfedge *h2 = new Halfedge();
    Halfedge *h3 = new Halfedge();

    // Allocate new edges on heap
    Edge *e1 = new Edge();
    Edge *e2 = new Edge();
    Edge *e3 = new Edge();

    // Assign a halfedge pointer to the triangle
    t->halfedge = h1;

    // Assign halfedge pointers to point masses
    t->pm1->halfedge = h1;
    t->pm2->halfedge = h2;
    t->pm3->halfedge = h3;

    // Update all halfedge pointers
    h1->edge = e1;
    h1->next = h2;
    h1->pm = t->pm1;
    h1->triangle = t;

    h2->edge = e2;
    h2->next = h3;
    h2->pm = t->pm2;
    h2->triangle = t;

    h3->edge = e3;
    h3->next = h1;
    h3->pm = t->pm3;
    h3->triangle = t;
  }

  // Go back through the cloth mesh and link triangles together using halfedge
  // twin pointers

  // Convenient variables for math
  int num_height_tris = (num_height_points - 1) * 2;
  int num_width_tris = (num_width_points - 1) * 2;

  bool topLeft = true;
  for (int i = 0; i < triangles.size(); i++) {
    Triangle *t = triangles[i];

    if (topLeft) {
      // Get left triangle, if it exists
      if (i % num_width_tris != 0) { // Not a left-most triangle
        Triangle *temp = triangles[i - 1];
        t->pm1->halfedge->twin = temp->pm3->halfedge;
      } else {
        t->pm1->halfedge->twin = nullptr;
      }

      // Get triangle above, if it exists
      if (i >= num_width_tris) { // Not a top-most triangle
        Triangle *temp = triangles[i - num_width_tris + 1];
        t->pm3->halfedge->twin = temp->pm2->halfedge;
      } else {
        t->pm3->halfedge->twin = nullptr;
      }

      // Get triangle to bottom right; guaranteed to exist
      Triangle *temp = triangles[i + 1];
      t->pm2->halfedge->twin = temp->pm1->halfedge;
    } else {
      // Get right triangle, if it exists
      if (i % num_width_tris != num_width_tris - 1) { // Not a right-most triangle
        Triangle *temp = triangles[i + 1];
        t->pm3->halfedge->twin = temp->pm1->halfedge;
      } else {
        t->pm3->halfedge->twin = nullptr;
      }

      // Get triangle below, if it exists
      if (i + num_width_tris - 1 < 1.0f * num_width_tris * num_height_tris / 2.0f) { // Not a bottom-most triangle
        Triangle *temp = triangles[i + num_width_tris - 1];
        t->pm2->halfedge->twin = temp->pm3->halfedge;
      } else {
        t->pm2->halfedge->twin = nullptr;
      }

      // Get triangle to top left; guaranteed to exist
      Triangle *temp = triangles[i - 1];
      t->pm1->halfedge->twin = temp->pm2->halfedge;
    }

    topLeft = !topLeft;
  }

  clothMesh->triangles = triangles;
  this->clothMesh = clothMesh;
}
