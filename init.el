;;-----------General Configurations
(setq frame-title-format "zhiker@emacs")
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode -1)
(set-default 'cursor-type 'hbar)
(ido-mode)
(column-number-mode)
(winner-mode)
(windmove-default-keybindings)
(linum-mode)

;;--------- package management -------------------------------------------------
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)
'(evil-search-module (quote evil-search))
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-M-z") 'switch-window)

(require 'alpha)
(global-set-key (kbd "C-M-)") 'transparency-increase)
(global-set-key (kbd "C-M-(") 'transparency-decrease)
;;---------Managing my package --------------------------------------------------
(require 'cl)
(defvar required-packages
  '(
    dash
    f
    avy
    anaconda-mode
    clojure-mode
    company
    company-anaconda
    dash
    emmet-mode
    evil
    evil-leader
    expand-region
    feature-mode
    flycheck
    highlight-indentation
    magit
    multi-term
    multiple-cursors
    simp
    smex
    switch-window
    yaml-mode
    solarized-theme
    yasnippet
    org
    ox-pandoc
    calfw
    web-mode
    )
  "a list of packages to ensure are installed at launch.")

; method to check if all packages are installed
(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

; if not all packages are installed, check one by one and install the missing ones.
(unless (packages-installed-p)
                                        ; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))
;;------- loading packages setup -----------------------------------------------
(load "~/.emacs.d/package-configurations/init-web-mode.el")
(load "~/.emacs.d/package-configurations/init-anaconda-mode.el")
(load "~/.emacs.d/package-configurations/init-color-theme.el")
(load "~/.emacs.d/package-configurations/init-company-anaconda.el")
(load "~/.emacs.d/package-configurations/init-company.el")
;(load "~/.emacs.d/package-configurations/init-evil.el")
(load "~/.emacs.d/package-configurations/init-erc.el")
(load "~/.emacs.d/package-configurations/init-expand-region.el")
(load "~/.emacs.d/package-configurations/init-feature-mode.el")
;(load "~/.emacs.d/package-configurations/init-flycheck.el")
(load "~/.emacs.d/package-configurations/init-ido.el")
(load "~/.emacs.d/package-configurations/init-magit.el")
(load "~/.emacs.d/package-configurations/init-multiple-cursors.el")
(load "~/.emacs.d/package-configurations/init-python.el")
(load "~/.emacs.d/package-configurations/init-ruby.el")
(load "~/.emacs.d/package-configurations/init-simp.el")
(load "~/.emacs.d/package-configurations/init-smex.el")
(load "~/.emacs.d/package-configurations/init-switch-window.el")
(load "~/.emacs.d/package-configurations/init-yaml-mode.el")
(load "~/.emacs.d/package-configurations/init-yasnippet.el")
(load "~/.emacs.d/package-configurations/init-calfw.el")
(load "~/.emacs.d/htmlize.el")
;;(load "~/.emacs.d/package-configurations/init-mu4e.el")

;;---- server-mode at start up ---
(server-start)
