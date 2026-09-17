class Contact < ApplicationRecord
	belongs_to :kind

	def birthdate_br
		I18n.l(self.birthdate) unless self.birthdate.blank?
	end

	def author
		"Victor"
	end

	def as_json(options={})
		super(
			root: true,
			methods: :author,
			include: {kind: { only: :description}}
		)

	def hello
		I18n.t('hello')
	end

	def i18n
		I18n.default_locale
	end
end
