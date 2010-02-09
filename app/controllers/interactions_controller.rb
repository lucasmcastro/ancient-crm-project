class InteractionsController < ApplicationController
  # GET /interactions
  # GET /interactions.xml
  def index
    @interactions = Interaction.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @interactions }
    end
  end

  # GET /interactions/1
  # GET /interactions/1.xml
  def show
    @interaction = Interaction.find(params[:id])
    @opportunity = @interaction.opportunity
    @account = @opportunity.account
    @notes = @interaction.notes

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @interaction }
    end
  end

  # GET /interactions/new
  # GET /interactions/new.xml
  def new
    @opportunity = Opportunity.find(params[:opportunity_id])
    @account = @opportunity.account
    @interaction = Interaction.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @interaction }
    end
  end

  # GET /interactions/1/edit
  def edit
    @interaction = Interaction.find(params[:id])
    @opportunity = @interaction.opportunity
    @account = @opportunity.account
  end

  # POST /interactions
  # POST /interactions.xml
  def create
    @opportunity = Opportunity.find(params[:opportunity_id])
    @interaction = Interaction.new(params[:interaction])
    @interaction.creator = current_user
    @interaction.opportunity = @opportunity 

    respond_to do |format|
      if @interaction.save
        flash[:notice] = 'Interação foi cadastrada com sucesso.'
        format.html { redirect_to(@opportunity) }
        format.xml  { render :xml => @interaction, :status => :created, :location => @opportunity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @interaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /interactions/1
  # PUT /interactions/1.xml
  def update
    @interaction = Interaction.find(params[:id])
    @opportunity = @interaction.opportunity

    respond_to do |format|
      if @interaction.update_attributes(params[:interaction])
        flash[:notice] = 'Interação foi atualizada com sucesso.'
        format.html { redirect_to(@opportunity) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @interaction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /interactions/1
  # DELETE /interactions/1.xml
  def destroy
    @interaction = Interaction.find(params[:id])
    @opportunity = @interaction.opportunity
    @interaction.destroy

    respond_to do |format|
      format.html { redirect_to(@opportunity) }
      format.xml  { head :ok }
    end
  end
end
