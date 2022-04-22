function onCreate()
    addLuaScript('Sepiamodchart')
    --objecto order
    setObjectOrder('boyfriendGroup', 2);
    setObjectOrder('dad', 99);
    --screen overlay stuff
    scaleObject('Overlay', 1.1, 1.1)
    setScrollFactor('Overlay', 0,0);
	  setObjectCamera('Overlay', 'hud')
    addLuaSprite('Overlay', false)    
    makeLuaSprite('Cracks1', 'Bendy/Cracks1', 0, 0)
    scaleObject('Cracks1', 1, 1)
    setScrollFactor('Cracks1', 0,0);
	  setObjectCamera('Cracks1', 'hud')  
    makeLuaSprite('Cracks2', 'Bendy/Cracks2', 0, 0)
    scaleObject('Cracks2', 1, 1)
    setScrollFactor('Cracks2', 0,0);
    setObjectCamera('Cracks2', 'hud')
    --intro stuff
    makeLuaSprite('black', 'Bendy/black', 0, 0)
    scaleObject('black', 10, 10)
    setScrollFactor('black', 0,0);
    setObjectCamera('black', 'hud')
    addLuaSprite('black', false)
    makeLuaSprite('bg1', 'Bendy/Hallway1', -1175, -825)
    addLuaSprite('bg1',false)
    makeLuaSprite('bg2', 'Bendy/Hallway2', -1175, -600)
    makeLuaSprite('bg3', 'Bendy/Hallway3', -1175, -650)
    setProperty('boyfriend.visible', false)
end

function onGameOverStart()
    runTimer('waiting', 2.5)
end
  
function onTimerCompleted(tag, loops, loopsLeft)
    math.randomseed(os.time())
    math.random(); math.random(); math.random()
      
    for x = 1, 1 do
        value = math.random(24,38)
        playSound(value, 5)
    end
end

local xx = 335;
local yy = 150;
local xx2 = 900;
local yy2 = 400;
local ofs = 50;

beatHitFuncs = {

    [1] = function()
        doTweenAlpha('blackfade1', 'black', 0, 1, 'circInOut')
    end,

    [3] = function()
        doTweenAlpha('blackfade2', 'black', 1, 1, 'circInOut')  
    end,

    [8] = function()
        doTweenAlpha('blackfade3', 'black', 0, 1, 'circInOut')
    end,

    [11] = function()
        doTweenAlpha('blackfade4', 'black', 1, 1, 'circInOut')  
    end,

    [13] = function()
        addLuaSprite('bg2',false)
    end,

    [16] = function()
        doTweenAlpha('blackfade3', 'black', 0, 1, 'circInOut')
    end,

    [18] = function()
        doTweenAlpha('blackfade4', 'black', 1, 1, 'circInOut')  
    end,

    [20] = function()
        addLuaSprite('bg3',false)
        end,

    [23] = function()
        doTweenAlpha('blackfade3', 'black', 0, 1, 'circInOut')
    end,

    [25] = function()
        doTweenAlpha('blackfade4', 'black', 1, 1, 'circInOut')  
    end,

    [27] = function()
        setProperty('boyfriend.visible', true)
        setProperty('bg1.visible', false)
        setProperty('bg2.visible', false)
        setProperty('bg3.visible', false)
    end,

    [28] = function()
        doTweenAlpha('blackfade4', 'black', 0, 2, 'circInOut')  
    end,

    [170] = function()
    addLuaSprite('Cracks1', false)  
    end,

    [298] = function()
    addLuaSprite('Cracks2', false)  
    end,
}

function onUpdate()
    if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
        triggerEvent('Camera Follow Pos',xx-ofs,yy)
    end
    if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
        triggerEvent('Camera Follow Pos',xx+ofs,yy)
    end
    if getProperty('dad.animation.curAnim.name') == 'singUP' then
        triggerEvent('Camera Follow Pos',xx,yy-ofs)
    end
    if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
        triggerEvent('Camera Follow Pos',xx,yy+ofs)
    end
    if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
        triggerEvent('Camera Follow Pos',xx-ofs,yy)
    end
    if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
        triggerEvent('Camera Follow Pos',xx+ofs,yy)
    end
    if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
        triggerEvent('Camera Follow Pos',xx,yy-ofs)
    end
    if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
        triggerEvent('Camera Follow Pos',xx,yy+ofs)
    end
end

function onBeatHit()
    if beatHitFuncs[curBeat] then 
        beatHitFuncs[curBeat]() -- Executes function at curBeat in beatHitFuncs
    end 
end