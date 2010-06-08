class StakeholdersController < ApplicationController
  # GET /stakeholders/new
  # GET /stakeholders/new.xml
  def new
    @interaction = Interaction.find(params[:interaction_id])
    @stakeholder = Stakeholder.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stakeholder }
    end
  end

  # POST /stakeholders
  # POST /stakeholders.xml
  def create
    @interaction = Interaction.find(params[:interaction_id])
    @stakeholder = Stakeholder.new(params[:stakeholder])
    @stakeholder.interaction = @interaction

    respond_to do |format|
      if @interaction.has_stakeholder?(@stakeholder.person_id)
        flash[:notice] = 'Erro: Esta pessoa já está participando dessa atividade.'
        format.html { redirect_to(@interaction) }
      elsif @stakeholder.save
        flash[:notice] = 'Participante foi adicionado com sucesso.'
        format.html { redirect_to(@interaction) }
        format.xml  { render :xml => @stakeholder, :status => :created, :location => @interaction }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stakeholder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stakeholders/1
  # DELETE /stakeholders/1.xml
  def destroy
    @stakeholder = Stakeholder.find(params[:id])
    @interaction = @stakeholder.interaction
    @stakeholder.destroy

    respond_to do |format|
      format.html { redirect_to(@interaction) }
      format.xml  { head :ok }
    end
  end
end
