class InfoController < FrontendController
  
  #before_filter :check_authentication, :except => [:competition,:vto_1, :vto_2, :vto_3, :vto_4, :about, :map, :faq, :accesibility, :contact, :download]
  before_filter :check_authentication, :except => [:rules, :vto_1, :vto_2, :vto_3, :vto_4, :about, :map, :faq, :accesibility, :contact, :download]
  
  def rules
    add_crumb "Pravidla soutěže"
  end  
  
  def competition
    add_crumb "Soutěž"
    #debugger
    @roundfirst = Round.first
    @round = Round.first( :conditions => 'date_from < now() AND date_till > now()')
  end
  
  def competition_submit
    add_crumb "Děkujeme za odpověď"
    #debugger
    @ur = UserRound.new
    @ur.user_id = current_user.id
    @ur.round_id = params[:round_id]
    @ur.save!
    @check_answers = 0
    params[:answer].each_value do |a|
      @ua = UserAnswer.new
      @ua.user_id = current_user.id
      @ua.answer_id = a
      @ua.save!
      @a = Answer.find(a)
      if(@a.rt)
        @check_answers = @check_answers + 1
      end  
    end
    #debugger
    if(@check_answers == 3)
      @ur.update_attributes( :answer_ok => true)
    else
      @ur.update_attributes( :answer_ok => false)
    end
    if(params[:first] == 'first')
      redirect_to competition_path
    end       
  end  
  
  def vto_1
    add_crumb "Bude vás to bavit"
  end
  
  def vto_2
    add_crumb "Najdete uplatnění"
  end
  
  def vto_3
    add_crumb "Vyděláte si"
  end  
  
  def vto_4
    add_crumb "Bude o vás zájem"
  end
  
  def about
    add_crumb "O Sdružení AP"
  end
  
  def map
    add_crumb "Interaktivní mapa"
    #@sections1 = Section.all
  end
  
  def faq
    add_crumb "FAQ"
  end
  
  def accesibility
    add_crumb "Prohlášení o přístupnosti"
  end
  
  def contact
    add_crumb "Kontakty"
  end          
  
  def download
    add_crumb "Ke stažení"
  end
  
end
