function onCreate()
    makeLuaSprite('jumpscare','Bendy/sin_fucking_swallow', 0, 0)
    setScrollFactor('jumpscare', 0,0);
    scaleObject('jumpscare', 0.7, 0.7)
	setObjectCamera('jumpscare', 'hud')
end

    function onEvent(name, value1, value2)
        if name == 'jumpscare guaranteed' then
            setProperty('jumpscare.visible', true)
            addLuaSprite('jumpscare', true)
            runTimer('scaring', (value1))
            triggerEvent('Screen Shake', 'value1, 0.01', 'value1, 0.01');
        end
    end

    function onTimerCompleted(tag, loops, loopsLeft)
        setProperty('jumpscare.visible', false)
    end