# Pin npm packages by running ./bin/importmap

pin "application"
pin_all_from "app/javascript/components", under: "components"
pin "shortfall", to: "shortfall.js"
pin "ticket_modal", to: "ticket_modal.js"