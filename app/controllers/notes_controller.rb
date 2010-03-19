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
    @commentable = find_commentable(params)
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
    @commentable = find_commentable(params)
    @note = Note.new(params[:note])
    @note.creator = current_user
    @note.commentable = @commentable
    @versionable = @note.versionable

    versionable_key = @versionable.class.class_name.downcase.to_sym
    @versionable.update_attributes(params[versionable_key]) if params.has_key? versionable_key
    @note.versionable_version = @versionable.version if (@note.valid? and @versionable.respond_to? :version)
    
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
  
  protected
  
  def find_commentable(params)
    commentable = Interaction.find(params[:interaction_id]) if params.has_key? :interaction_id
    commentable = Issue.find(params[:issue_id]) if params.has_key? :issue_id
    commentable    
  end
end
