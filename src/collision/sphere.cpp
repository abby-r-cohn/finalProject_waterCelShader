#include <nanogui/nanogui.h>

#include "../clothMesh.h"
#include "../misc/sphere_drawing.h"
#include "sphere.h"

using namespace nanogui;
using namespace CGL;

void Sphere::collide(PointMass &pm) {
  // TODO (Part 3): Handle collisions with spheres.
    Vector3D dist_toCenter = pm.position - origin;
    if (dist_toCenter.norm() < radius) { //pm is inside the sphere
        dist_toCenter.normalize();
        Vector3D tangentPoint = dist_toCenter * radius + origin;
        Vector3D correctionVector = tangentPoint - pm.last_position;
        pm.position = pm.last_position + (1.0 - friction)*(correctionVector);
    }

}

void Sphere::render(GLShader &shader) {
  // We decrease the radius here so flat triangles don't behave strangely
  // and intersect with the sphere when rendered
  m_sphere_mesh.draw_sphere(shader, origin, radius * 0.92);
}
