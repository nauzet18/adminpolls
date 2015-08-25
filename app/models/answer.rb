class Answer < ActiveRecord::Base
  belongs_to :question

  default_scope { order('id') }

  validates :name, :question, presence: true
  #El campo correct no tiene por que estar presente al guardarlo. 
  #En la BD tiene un valor por defecto a false y si se implementa con un input checkbox, 
  #no siempre se enviara en el post.
  #NOTA: creo que se puede hacer la validacion para que sea un tipo bolean, pero para probar...
  validates :correct, exclusion: { in: [nil] }
end
