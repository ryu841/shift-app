# Pin npm packages by running ./bin/importmap

pin "application"
pin_all_from "app/javascript/components", under: "components"
pin "shortfall", to: "shortfall.js"
pin "ticket_modal", to: "ticket_modal.js"
pin "delete_modal", to: "delete_modal.js"
pin "cancel_modal", to: "cancel_modal.js"
pin "navbar_toggle", to: "navbar_toggle.js"