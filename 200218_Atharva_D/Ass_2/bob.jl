function bob(stimulus)
    question ="question"
    text = uppercase(question)

    if stimulus[end] == '?'
        return "Sure."
    elseif stimulus == text
        return "Whoa, chill out!"
    elseif stimulus == text * '?'
        return "Calm down, I know what I'm doing!"
    elseif stimulus == ' '
        return "Fine. Be that way!"
    else return "Whatever."
    end


end
