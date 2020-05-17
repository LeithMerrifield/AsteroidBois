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
      rock.CheckBulletCollision(player.m_bullets);
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
