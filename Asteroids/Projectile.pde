/*
  Auther: Leith Merrifield 
  Description: Class for each projectile
*/

class Projectile 
{
  PVector m_position = new PVector();
  PVector m_speed = new PVector();
  float m_size = 3f;
  float m_bulletSpeed = 10f;
  boolean m_flagToDestroy = false;
  
  Projectile(float x, float y, float rotation)
  {
    m_speed.x = m_bulletSpeed * sin(rotation);
    m_speed.y = m_bulletSpeed * -cos(rotation);
    m_position.x = x;
    m_position.y = y;
  }
  
  void OnUpdate()
  {
      m_position.x += m_speed.x;
      m_position.y += m_speed.y;
  }
  
  void OnDraw()
  {
    circle(m_position.x + width / 2, m_position.y + height / 2, m_size);
  }
}
  
