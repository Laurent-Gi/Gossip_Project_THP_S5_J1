class GossipsController < ApplicationController

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def edit
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
    # quasi même code que show car on aura besoin de récupérer notre article pour préremplir le formulaire d'édition
    @gossip = Gossip.find(params[:id])
  end

  def new
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (views/gossips/new.html.erb)
    puts "="*72
    @gossip = Gossip.new
    puts "="*72
  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.update(gossip_params)

    redirect_to gossips_path # renvoie à la page principale des potins
    # redirect_to @gossip # ça marche très bien ça pour voir la carte du son gossip créé !
    # redirect_to root_path  # Idem
  end


  def create
    @gossip = Gossip.new(gossip_params) # avec les données obtenues à partir du formulaire (+ les autorisations)

    # On rajoute un utilisateur "anonymous pour l'instant"
    user_ano = User.find_by(first_name: "anonymous")
    @gossip.user = user_ano

    # puts params.inspect
    # puts @gossip.inspect

  #   gossip = Gossip.update(gossip_params)   ce serait bien à la place de new + modif +save ?

    if @gossip.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      # redirect_to gossips_path # vers la méthode show cette fois
      puts "ça fonctionne"

      redirect_to gossip_path(@gossip.id) #, :flash => { :success => "Votre Gossip a été créé" }

      # @gossips = Gossip.all
      # render 'index' # vers la méthode show cette fois
      # render gossips_path # vers la méthode show cette fois
      # redirect_to gossips_path, :flash => { :success => "Votre Gossip a été créé" }

    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      render new_gossip_path
      # render 'new'
    end

    puts "*" *72

  end


  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end

  private

  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end

end
