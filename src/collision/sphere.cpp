#include <nanogui/nanogui.h>

#include "../clothMesh.h"
#include "../misc/sphere_drawing.h"
#include "sphere.h"

using namespace nanogui;
using namespace CGL;

void Sphere::collide(PointMass &pm) {
  // TODO (Part 3): Handle collisions with spheres.
    Vector3D pos = pm.position;
    Vector3D dis = pos - origin;
    //Vector3D tangent_point = Vector3D(0, 0, 0);
    if (dis.norm() < radius) {
        dis.normalize();
        Vector3D correction = (dis * radius) + origin - pm.last_position;
        pm.position = (1.0 - friction) * correction + pm.last_position;
    }
}

void Sphere::render(GLShader &shader) {
  // We decrease the radius here so flat triangles don't behave strangely
  // and intersect with the sphere when rendered
  m_sphere_mesh.draw_sphere(shader, origin, radius * 0.92);
}
