boolean isPlaying = true;

class Game
{
  Ship player;
  ArrayList<Asteroid> asteroidList = new ArrayList<Asteroid>();
  int asteroidCount = 1;
  
  Game() 
  {
    for(int i = 0; i < asteroidCount; i++)
    {
      asteroidList.add(new Asteroid());
    }

    player = new Ship(100);
  }
  
  void OnUpdate()
  {
    player.OnUpdate();
    
    for(Asteroid rock : asteroidList)
    {
      rock.OnUpdate();
      AsteroidCollision(rock);
    }
  }
  
  void AsteroidCollision(Asteroid rock)
  {
    rock.CheckBulletCollision(player.m_bullets);
    if(rock.m_position.x + rock.m_asteroidImage.width > (player.m_location.x + width/2) &&
       rock.m_position.x - rock.m_asteroidImage.width < (player.m_location.x + width/2 -player.playerShip.width/2) &&
       rock.m_position.y + rock.m_asteroidImage.height > (player.m_location.y + height/2) &&
       rock.m_position.y - rock.m_asteroidImage.height < (player.m_location.y + width/2 -player.playerShip.width/2)) 
       {
         println("DEAD");
       }
  }
  
  void OnDraw()
  {
    player.OnDraw();
    
    for(Asteroid rock : asteroidList)
    {
      rock.OnDraw();
    }
  }
}
