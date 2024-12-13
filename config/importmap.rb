# Pin npm packages by running ./bin/importmap

pin "tailwind", to: "tailwind.css"
pin "application", to: "application.js", preload: true
pin_all_from "app/javascript/components", under: "components"
pin "shortfall", to: "shortfall.js"
pin "ticket_modal", to: "ticket_modal.js"
pin "delete_modal", to: "delete_modal.js"
pin "cancel_modal", to: "cancel_modal.js"
pin "navbar_toggle", to: "navbar_toggle.js", preload: true
pin "shift_form", to: "shift_form.js"