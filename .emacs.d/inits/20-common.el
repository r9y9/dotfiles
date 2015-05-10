;; flymake
(eval-after-load 'flymake '(require 'flymake-cursor))

;; pyflakes
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq ac-auto-start t)

;; helm
(require 'helm-config)
(helm-mode 1)

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
;; (eval-after-load "go-mode"
;;  '(require 'flymake-go))

;; go-autocomplete
(eval-after-load "go-mode"
  '(progn
     (require 'go-autocomplete)))

;; gofmt
(add-hook 'before-save-hook #'gofmt-before-save)

;; clang-format
(load "clang-format.el")
(global-set-key  (kbd "<f12>") 'clang-format-region)

;; julia
(require 'julia-mode)
(add-hook 'julia-mode-hook 'auto-complete-mode)

;; Python
(require 'py-autopep8)
;; (add-hook 'before-save-hook 'py-autopep8-before-save)

;; Rust
(require 'rust-mode)
(add-hook 'rust-mode-hook 'auto-complete-mode)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(require 'flymake-rust)
(add-hook 'rust-mode-hook 'flymake-rust-load)

(setq py-autopep8-options '("--max-line-length=80"))

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)                 ; optional
