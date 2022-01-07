# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "https://ga.jspm.io/npm:@hotwired/stimulus@3.0.1/dist/stimulus.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "js-autocomplete", to: "https://ga.jspm.io/npm:js-autocomplete@1.0.4/auto-complete.min.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@tarekraafat/autocomplete.js", to: "https://ga.jspm.io/npm:@tarekraafat/autocomplete.js@10.2.6/dist/autoComplete.min.js"
pin "react", to: "https://ga.jspm.io/npm:react@17.0.2/index.js"
pin "object-assign", to: "https://ga.jspm.io/npm:object-assign@4.1.1/index.js"
pin "react-dom", to: "https://ga.jspm.io/npm:react-dom@17.0.2/index.js"
pin "scheduler", to: "https://ga.jspm.io/npm:scheduler@0.20.2/index.js"
pin "stimulus-autocomplete", to: "https://ga.jspm.io/npm:stimulus-autocomplete@3.0.0-rc.6/src/autocomplete.js"
