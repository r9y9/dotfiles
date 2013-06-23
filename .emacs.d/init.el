;; for emacs 24
(add-to-list 'load-path "~/.emacs.d/elpa/init-loader-20130218.1210")
(require 'init-loader)

(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")
