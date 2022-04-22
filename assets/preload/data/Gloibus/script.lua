
function onCreate()
    addLuaScript('bendyfont')
    makeLuaSprite('black', 'black', 0, 0)
    addLuaSprite('black', true)
    doTweenAlpha('blackfadegone', 'black', 0, 1, 'linear')
    setScrollFactor('black', 0,0);
    setObjectCamera('black', 'hud')
end

function goodNoteHit()
    health = getProperty('health')
      setProperty('health', health+ 0.015);
  end
  

beatHitFuncs = {
    [272] = function()
        doTweenAlpha('blackfadehere', 'black', 0.4, 3, 'linear')
    end,

    [336] = function()
        doTweenAlpha('blackfadehere', 'black', 0, 1, 'linear')
    end,

    [406] = function()
        characterPlayAnim('bender', 'spin', true)
    end,
    }
    
function onBeatHit()

    if beatHitFuncs[curBeat] then 
        beatHitFuncs[curBeat]() -- Executes function at curBeat in beatHitFuncs
    end 

end


function onGameOverStart()
    runTimer('waiting', 2.5)
    end
    
    function onTimerCompleted(tag, loops, loopsLeft)
        if tag == 'waiting' then 
        math.randomseed(os.time())
        math.random(); math.random(); math.random()
        
            for x = 1, 1 do
                value = math.random(17)
                playSound(value, 10)
            end
        end
    end
    
