function onGameOverStart()
    runTimer('waiting', 2.5)
    end
    
    function onTimerCompleted(tag, loops, loopsLeft)
        math.randomseed(os.time())
        math.random(); math.random(); math.random()
        
            for x = 1, 1 do
                value = math.random(18,23)
                playSound(value)
            end
    end
    