local angleshit = 1;
local anglevar = 1;
function onCreate()
	makeLuaSprite('bg','Bendy/ProjectionistBG',-1175, -825)
	addLuaSprite('bg',false)
end

function onBeatHit()
	if beatHitFuncs[curBeat] then 
		beatHitFuncs[curBeat]() -- Executes function at curBeat in beatHitFuncs
	end 
end

function onStepHit()

   if stepHitFuncs[curStep] then 
	   stepHitFuncs[curStep]() -- Executes function at curStep in stepHitFuncs
   end 

end