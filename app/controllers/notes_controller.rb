class NotesController < ApplicationController
  # GET /notes
  # GET /notes.xml
  def index
    @notes = Note.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @notes }
    end
  end

  # GET /notes/1
  # GET /notes/1.xml
  def show
    @note = Note.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @note }
    end
  end

  # GET /notes/new
  # GET /notes/new.xml
  def new
    if params.has_key? :interaction_id
      @commentable = Interaction.find(params[:interaction_id])
    elsif params.has_key? :issue_id
      @commentable = Issue.find(params[:issue_id])
    end
    @note = Note.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @note }
    end
  end

  # GET /notes/1/edit
  def edit
    @note = Note.find(params[:id])
  end

  # POST /notes
  # POST /notes.xml
  def create
    if params.has_key? :interaction_id
      @commentable = Interaction.find(params[:interaction_id])
    elsif params.has_key? :issue_id
      @commentable = Issue.find(params[:issue_id])
    end
    @note = Note.new(params[:note])
    @note.creator = current_user
    @note.commentable = @commentable

    respond_to do |format|
      if @note.save
        flash[:notice] = 'Note was successfully created.'
        format.html { redirect_to(@commentable) }
        format.xml  { render :xml => @note, :status => :created, :location => @commentable }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.xml
  def update
    @note = Note.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        flash[:notice] = 'Note was successfully updated.'
        format.html { redirect_to(@note) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.xml
  def destroy
    @note = Note.find(params[:id])
    @commentable = @note.commentable
    @note.destroy

    respond_to do |format|
      format.html { redirect_to(@commentable) }
      format.xml  { head :ok }
    end
  end
end
