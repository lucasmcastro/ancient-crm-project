class LinksController < ApplicationController
  # GET /links/new
  # GET /links/new.xml
  def new
    @link = Link.new
    @person = Person.find(params[:person_id])
    if params.has_key? :rel
      @rel = params[:rel]
    else
      @rel = 'Account'
    end
    
    if @rel == 'Person'
      @linkable = Person.all
      @linktype_choices = @link.linktype_choices_for_person
      @rel_to = 'Pessoa'
    elsif @rel == 'Account'
      @linkable = Account.all
      @linktype_choices = @link.linktype_choices_for_account
      @rel_to = 'Conta'
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @link }
    end
  end

  # GET /links/1/edit
  def edit
    @link = Link.find(params[:id])
    @person = @link.person
    @rel = @link.linkable_type
    
    if @rel == 'Person'
      @linktype_choices = @link.linktype_choices_for_person
    elsif @rel == 'Account'
      @linktype_choices = @link.linktype_choices_for_account
    end


  end

  # POST /links
  # POST /links.xml
  def create
    @link = Link.new(params[:link])
    @person = Person.find(params[:person_id])
    @link.creator = current_user
    @link.person = @person
    
    respond_to do |format|
      if @link.save
        flash[:notice] = 'Relacionamento criado com sucesso.'
        format.html { redirect_to(@person) }
        format.xml  { render :xml => @link, :status => :created, :location => @person }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /links/1
  # PUT /links/1.xml
  def update
    @link = Link.find(params[:id])

    respond_to do |format|
      if @link.update_attributes(params[:link])
        flash[:notice] = 'Relacionamento foi atualizado com sucesso.'
        format.html { redirect_to(@link.person) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.xml
  def destroy
    @link = Link.find(params[:id])
    @person = @link.person
    @link.destroy

    respond_to do |format|
      format.html { redirect_to(@person) }
      format.xml  { head :ok }
    end
  end
end
