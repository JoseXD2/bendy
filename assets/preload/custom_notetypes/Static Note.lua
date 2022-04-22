function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Static Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Bendy/Static Note'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Static Note' then
		makeAnimatedLuaSprite('Glitch', 'Bendy/Static', 0, 0)
	    addLuaSprite('Glitch', true)
	    addAnimationByPrefix('Glitch', true)
		runTimer('playing', 1)
		scaleObject('Glitch', 2.5, 2.5)
		setScrollFactor('Glitch', 0,0);
		setObjectCamera('Glitch', 'hud')
		function onTimerCompleted(tag, loops, loopsLeft)
			setProperty('Glitch.visible', false)
		end
	end
end