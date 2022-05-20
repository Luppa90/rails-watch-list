class AddReleaseYearAndLanguageToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :release_year, :integer
    add_column :movies, :language, :string
  end
end
