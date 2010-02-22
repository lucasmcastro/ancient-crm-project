class VersionExistingIssues < ActiveRecord::Migration
  def self.up
    say_with_time "Setting initial version to existing issues" do
      Issue.find_each(&:touch)
    end
  end

  def self.down
  end
end
