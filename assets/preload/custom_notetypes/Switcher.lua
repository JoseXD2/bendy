-- Idea, animations and tiny code asjustments by dk. 
-- Original code by Keoki
-- Made by Kevin Kuntz
function onCreate()
rando = getRandomInt(0, 3)

    for i = 0, getProperty('unspawnNotes.length')-1 do
	--Check if the note is an Instakill Note
	    if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Switcher' then
		setPropertyFromGroup('unspawnNotes', i, 'texture', 'Bendy/glitch'); --Change texture
	    end
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Switcher' and not isSustainNote then
	rando = getRandomInt(0, 3)
	end
end

function onUpdatePost(elapsed)
	for a = 0, getProperty('notes.length') - 1 do
		strumTime = getPropertyFromGroup('notes', a, 'strumTime');
		noteData = getPropertyFromGroup('notes', a, 'noteData');
		if getPropertyFromGroup('notes', a, 'noteType') == 'Switcher' then
			if getPropertyFromGroup('notes', a, 'animation.curAnim.curFrame') >= 3 then -- very important
					setPropertyFromGroup('notes', a, 'animation.curAnim.paused', true)
			end
			
			if (strumTime - getSongPosition()) < 250 then
				setPropertyFromGroup('notes', a, 'noteData', rando);
			
				if noteData == 0 then
					
					if getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'redScroll' then
					setPropertyFromGroup('notes', a, 'x', getPropertyFromGroup('notes', a, 'x') + 350)
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'Bendy/glitch');
					
					elseif getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'greenScroll' then
					setPropertyFromGroup('notes', a, 'x', getPropertyFromGroup('notes', a, 'x') + 230)
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'Bendy/glitch');
					
					elseif getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'blueScroll' then
					setPropertyFromGroup('notes', a, 'x', getPropertyFromGroup('notes', a, 'x') + 120)
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'Bendy/glitch');
					end
				elseif noteData == 1 then
					
					if getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'purpleScroll' then
					setPropertyFromGroup('notes', a, 'x', getPropertyFromGroup('notes', a, 'x') - 113)
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'Bendy/glitch');
					
					elseif getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'greenScroll' then
					setPropertyFromGroup('notes', a, 'x', getPropertyFromGroup('notes', a, 'x') + 113)
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'Bendy/glitch');
					
					elseif getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'redScroll' then
					setPropertyFromGroup('notes', a, 'x', getPropertyFromGroup('notes', a, 'x') + 230)
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'Bendy/glitch');
					end
				elseif noteData == 2 then
				
					if getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'purpleScroll' then
					setPropertyFromGroup('notes', a, 'x', getPropertyFromGroup('notes', a, 'x') - 230)
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'Bendy/glitch');
					
					elseif getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'redScroll' then
					setPropertyFromGroup('notes', a, 'x', getPropertyFromGroup('notes', a, 'x') + 115)
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'Bendy/glitch');
					
					elseif getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'blueScroll' then
					setPropertyFromGroup('notes', a, 'x', getPropertyFromGroup('notes', a, 'x') - 115)
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'Bendy/glitch');
					end
				elseif noteData == 3 then
					
					if getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'purpleScroll' then
					setPropertyFromGroup('notes', a, 'x', getPropertyFromGroup('notes', a, 'x') - 350)
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'Bendy/glitch');
					
					elseif getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'blueScroll' then
					setPropertyFromGroup('notes', a, 'x', getPropertyFromGroup('notes', a, 'x') - 230)
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'Bendy/glitch');
					
					elseif getPropertyFromGroup('notes', a, 'animation.curAnim.name') == 'greenScroll' then
					setPropertyFromGroup('notes', a, 'x', getPropertyFromGroup('notes', a, 'x') - 115)
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'Bendy/glitch');
					end
				end
			elseif (strumTime - getSongPosition()) < 370 then
				if rando == 0 and noteData ~= 0 then
				setPropertyFromGroup('notes', a, 'texture', 'purpleswitches');
				elseif rando == 1 and noteData ~= 1 then
				setPropertyFromGroup('notes', a, 'texture', 'blueswitches');
				elseif rando == 2 and noteData ~= 2 then
				setPropertyFromGroup('notes', a, 'texture', 'greenswitches');
				elseif rando == 3 and noteData ~= 3 then
				setPropertyFromGroup('notes', a, 'texture', 'redswitches');
				end
			end
		end
	end
end