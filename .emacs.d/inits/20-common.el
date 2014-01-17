;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq ac-auto-start t)

;; helm
(when (display-graphic-p)
  (require 'helm-config)
  (helm-mode 1)
)

;; YASnippet
;; load YASnippet expect for no-window mode
(when (display-graphic-p)
  (add-to-list 'load-path "~/.emacs.d/yasnippet")
  (require 'yasnippet)
  (setq yas-snippet-dirs
	'("~/.emacs.d/snippets"            ;; personal snippets
	  "~/.emacs.d/elpa/yasnippet/snippets"  ;; the default collection
	  ))
  (yas-global-mode 1)
)

;; zencoding (called with C-j in default)
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)

;; flymake-go
(eval-after-load "go-mode"
  '(require 'flymake-go))

;; clang-format
(load "clang-format.el")
(global-set-key  (kbd "<f12>") 'clang-format-region)
