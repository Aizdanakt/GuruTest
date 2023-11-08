# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'utilities/sorting', to: 'sorting.js', preload: true
pin 'utilities/password_confirm', to: 'password_confirm.js', preload: true
pin 'utilities/form_inline', to: 'form_inline.js', preload: true
pin 'utilities/progres_bar', to: 'progres_bar.js', preload: true

