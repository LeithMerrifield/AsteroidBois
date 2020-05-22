boolean isPlaying = true;

class Game
{
  Ship player;
  ArrayList<Asteroid> asteroidList = new ArrayList<Asteroid>();
  int asteroidCount = 10;
  int score = 0;
  
  PImage heartActive;
  PImage heartInactive;
  int heartSize = 50;
  
  boolean beenHit = false;
  
  int currentWave = 1;
  int asteroidsPerWave = 5;
  float splashCooldown = 2f;
  float timeOnSplash = 0f;
  boolean splashEnabled = false;
  boolean startWave = false;

  Game() 
  {
    heartActive = loadImage(dataPath("Lives\\HeartActive.png"));
    heartInactive = loadImage(dataPath("Lives\\HeartInactive.png"));
    heartActive.resize(heartSize,heartSize);
    heartInactive.resize(heartSize,heartSize);

    player = new Ship(3);
  }
  
  void OnUpdate()
  {
    WaveUpate();
    
    player.OnUpdate();
    
    println(asteroidList.size());
    
    if(player.m_currentHealth <= 0)
    {
     //dead 
    }
    
    for(int i = 0; i < asteroidList.size(); i++)
    {
      Asteroid rock = asteroidList.get(i);
      rock.OnUpdate();
      AsteroidCollision(rock);
      if(rock.m_flagToDestroy)
      {
        asteroidList.remove(i);
      }
    }
  }

  void OnDraw()
  {
    player.OnDraw();
    
    for(Asteroid rock : asteroidList)
    {
      rock.OnDraw();
    }
    
    DrawScore();
    DrawLives();
  }
  
  void WaveUpate()
  {
   if(!startWave)
   {
     splashEnabled = true;  
     timeOnSplash = millis();
     startWave = true;
     return;
   }
   
   if(splashEnabled && (millis() - timeOnSplash) / 1000 < splashCooldown) //<>//
   {
     textAlign(CENTER,CENTER);
     text("Wave: " + str(currentWave), width / 2, height / 4);
     return;
   }
   else if(splashEnabled && (millis() - timeOnSplash) / 1000 > splashCooldown)
   {
     for(int i = 0; i < asteroidsPerWave * currentWave; i++)
     {
       asteroidList.add(new Asteroid());
     }
     splashEnabled = false;
     return;
   }
   
   if(asteroidList.size() == 0)
   {
     startWave = false;
     currentWave++;
   }
  }
  
  void AsteroidCollision(Asteroid rock)
  {
    
    // increments score and splits asteroids
    if(rock.CheckBulletCollision(player.m_bullets))
    {
      score++;
      if(rock.m_asteroidImage.width > rock.m_minSize)
      {
        int newSize = rock.m_asteroidImage.width / 2;
        asteroidList.add(new Asteroid(rock.m_speed, newSize,rock.m_asteroidImage,rock.m_position));
        rock.m_asteroidImage.resize(newSize, newSize);
        rock.RandomDirection();
      }
      else
      {
        rock.m_flagToDestroy = true;
      }
    }
         
    // detects if the player has collided with the rock and will only minus a life
    // on entry of an asteroid
   if(!beenHit && dist((player.m_location.x + width/2),
                      (player.m_location.y + height/2),
                      (rock.m_position.x + rock.m_asteroidImage.width/2),
                      (rock.m_position.y + rock.m_asteroidImage.height/2)) <
                      (rock.m_asteroidImage.width/2 + player.playerShip.width/2))
   {
     if(rock.m_isPlayerOn)
     {
       return;
     }
     
     beenHit = true;
     rock.m_isPlayerOn = true;
     player.m_currentHealth--;
   }
   else
   {
       beenHit = false;
   }
   
   if(debugLines)
   {
     line((player.m_location.x + width/2),
          (player.m_location.y + height/2),
          (rock.m_position.x + rock.m_asteroidImage.width/2), 
          (rock.m_position.y + rock.m_asteroidImage.height/2));
   }
  }

  // draws the player's lives
  void DrawLives()
  {
    for(int i = 0; i < player.m_maxHealth; i++)
    {
      if(i > player.m_currentHealth - 1)
      {
        image(heartInactive,20 + (i * (heartActive.width + 10)),30);      
      }
      else
      {
        image(heartActive,20 + (i * (heartActive.width + 10)),30);
      }
    }
  }
  
  void DrawScore()
  {
    fill(255);
    text("Score: " + str(score), width - 350, 50);
  }
}
