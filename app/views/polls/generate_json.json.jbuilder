json.poll do 
  json.id @poll.id
  json.name @poll.name
  
  json.groups @poll.groups do |group|

    json.id group.id
    json.name group.name
            
    json.questions group.questions do |question|

      json.id question.id
      json.name question.name

      json.answers question.answers do |answer|

        json.id answer.id
        json.name answer.name  
        json.correct answer.correct

      end
    end
  end
end