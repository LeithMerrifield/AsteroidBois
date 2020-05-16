class Asteroid
{
  int m_minSize = 50;
  int m_maxSize = 100;
  int m_spawnOffset = 50;
  
  PVector m_position = new PVector();
  PVector m_direction = new PVector();
  PVector m_velocity = new PVector();
  
  boolean m_wrapRock = false;
  float m_speed = .8f;
  PImage m_asteroidImage;
  
  public Asteroid()
  {
    File folder = new File(dataPath("Rocks\\"));
    String[] filenames = folder.list();
    String path = filenames[(int)random(0,filenames.length)];
    //String path = filenames[filenames.length - 1];
    PImage newRock = loadImage(dataPath("Rocks\\" + path));
    int size = (int)random(m_minSize,m_maxSize);
    
    newRock.resize(size,size);
    m_asteroidImage = newRock;
    SetRandomSpawn();
    GetDirection();
  }
  
  void OnUpdate()
  {
    if(isPlaying)
    {
      Movement();
      
      if((m_position.x > 0 && m_position.x < width) && (m_position.y > 0 && m_position.y < height))
        m_wrapRock = true;
      
      if(m_wrapRock)
        ScreenWrap();
    }
  }

  void OnDraw()
  {    
    fill(255);
    image(m_asteroidImage,m_position.x,m_position.y);
  }
  
  void ScreenWrap()
  {
    if(m_position.x > width + m_asteroidImage.width) 
    {
      m_position.x = 0 - m_asteroidImage.width; //<>// //<>// //<>// //<>//
    }
    if(m_position.y > height + m_asteroidImage.height) 
    {
      m_position.y = 0 - m_asteroidImage.height; //<>// //<>// //<>// //<>//
    }
    if(m_position.y < 0 - m_asteroidImage.height) 
    {
      m_position.y = height + m_asteroidImage.height;
    }
    if(m_position.x < 0 - m_asteroidImage.width) 
    {
      m_position.x = width + m_asteroidImage.width;
    }
  }
  
  void Movement()
  {
    m_velocity.add(m_direction);
    m_velocity.mult(m_speed);
    m_position.add(m_velocity);
  }
  
  // Will spawn asteroids outside of the screen by the offset
  void SetRandomSpawn()
  {
   if(random(0,50) > 25)
   {
     m_position.x = 0 - m_spawnOffset;
     m_position.y = random(0,height);
   }
   else
   {
     m_position.x = random(0,width);
     m_position.y = 0 - m_spawnOffset;
   }
   
   if(random(0,50) > 25 && m_position.x < 0)
   {
     m_position.x = width + m_spawnOffset;
   }
   if(random(0,50) > 25 && m_position.y < 0)
   {
     m_position.y = height + m_spawnOffset;
   }
  }
  
  void GetDirection()
  {
    if(m_position.x > width)
    {
      m_direction.y = random(0,height);
      m_direction.x = 0;
    }
    else if(m_position.x < 0)
    {
      m_direction.y = random(0,height);
      m_direction.x = width;
    }
    else if(m_position.y > height)
    {
      m_direction.x = random(0,width);
      m_direction.y = 0;
    }
    else if(m_position.y < 0)
    {
      m_direction.x = random(0,width);
      m_direction.y = height;
    }
    m_direction = PVector.sub(m_direction,m_position);
    m_direction.normalize();
  }
  
  void CheckCollision()
  {
    
  }
}
