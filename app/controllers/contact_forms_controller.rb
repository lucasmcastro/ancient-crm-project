class ContactFormsController < ApplicationController
  # GET /contact_forms/new
  # GET /contact_forms/new.xml
  def new
    @contactable = find_contactable(params)
    @contact_form = ContactForm.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contact_form }
    end
  end

  # GET /contact_forms/1/edit
  def edit
    @contact_form = ContactForm.find(params[:id])
    @contactable = @contact_form.contactable
  end

  # POST /contact_forms
  # POST /contact_forms.xml
  def create
    @contactable = find_contactable(params)    
    @contact_form = ContactForm.new(params[:contact_form])
    @contact_form.contactable = @contactable

    respond_to do |format|
      if @contact_form.save
        flash[:notice] = 'Forma de contato foi adicionada com sucesso.'
        format.html { redirect_to(@contactable) }
        format.xml  { render :xml => @contact_form, :status => :created, :location => @contactable }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contact_form.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contact_forms/1
  # PUT /contact_forms/1.xml
  def update
    @contact_form = ContactForm.find(params[:id])
    @contactable = @contact_form.contactable
    
    respond_to do |format|
      if @contact_form.update_attributes(params[:contact_form])
        flash[:notice] = 'Forma de contato foi atualizada com sucesso.'
        format.html { redirect_to(@contactable) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contact_form.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_forms/1
  # DELETE /contact_forms/1.xml
  def destroy
    @contact_form = ContactForm.find(params[:id])
    @contactable = @contact_form.contactable
    @contact_form.destroy

    respond_to do |format|
      format.html { redirect_to(@contactable) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def find_contactable(params)
    contactable = Person.find(params[:person_id]) if params.has_key? :person_id
    contactable
  end
end
