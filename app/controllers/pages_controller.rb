class PagesController < ApplicationController
	def home
		@films = Film.all
		@series = Series.all
		@documentaires = Documentaire.all
	end
end
