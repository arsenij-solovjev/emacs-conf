 (add-to-list 'load-path
               "~/.emacs.d/plugins/yasnippet-0.6.1c/")
 (add-to-list 'load-path "~/.emacs.d/plugins/ensime/elisp/")
 (add-to-list 'load-path "~/.emacs.d/plugins/scala-mode2/")
 (add-to-list 'load-path "~/.emacs.d/extensions/tequilasunset-auto-complete-latex/")
 (add-to-list 'load-path "~/.emacs.d/plugins/web-mode/")
 (add-to-list 'load-path "~/.emacs.d/plugins/emacs-eclim/")

;; (define-key company-active-map "\t" 'company-yasnippet-or-completion)

;; (defun company-yasnippet-or-completion ()
;;   (interactive)
;;   (if (yas/expansion-at-point)
;;       (progn (company-abort)
;;              (yas/expand))
;;     (company-complete-common)))

;; (defun yas/expansion-at-point ()
;;   "Tested with v0.6.1. Extracted from `yas/expand-1'"
;;     (first (yas/current-key)))



 (require 'scala-mode)
 (require 'ensime)
 (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
 (require 'yasnippet) ;; not yasnippet-bundle
 (yas/initialize)
 (yas/load-directory "~/.emacs.d/plugins/yasnippet-0.6.1c/snippets")
 (add-hook 'scala-mode-hook
             '(lambda ()
                (yas/minor-mode-on)
                ))
 (setq ensime-sem-high-faces
 '(
 (var . (:foreground "#ff2222"))
 (val . (:foreground "#dddddd"))
 (varField . (:foreground "#ff3333"))
 (valField . (:foreground "#dddddd"))
 (functionCall . (:foreground "#84BEE3"))
 (param . (:foreground "#ffffff"))
 (class . font-lock-type-face)
 (trait . (:foreground "#084EA8"))
 (object . (:foreground "#026DF7"))
 (package . font-lock-preprocessor-face)
 ))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (deeper-blue)))
 '(doc-view-continuous t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;(require 'auto-complete-latex)
;;(setq ac-l-dict-directory "~/.emacs.d/extensions/tequilasunset-auto-complete-latex/ac-l-dict/")
;;(add-to-list 'ac-modes 'foo-mode)
;;(add-hook 'foo-mode-hook 'ac-l-setup)
;;(add-to-list 'ac-modes 'latex-mode)

;;  ;; auto-refresh
 (global-auto-revert-mode t)

 ;; Interactively Do Things (highly recommended, but not strictly required)
        (require 'ido)
        (ido-mode t)
     
        ;; Rinari
        (add-to-list 'load-path "~/.emacs.d/plugins/rinari/")
        (require 'rinari)
 ;; auto display line numbers
 (global-linum-mode t)
 ;; always auto complete
 (global-auto-complete-mode t)
 ;; fold sections in auctex
 (add-hook 'LaTeX-mode-hook (lambda ()
                              (TeX-fold-mode 1)))

 ;; add el-get
 (add-to-list 'load-path "~/.emacs.d/el-get/el-get")

 (unless (require 'el-get nil 'noerror)
   (with-current-buffer
       (url-retrieve-synchronously
        "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
     (goto-char (point-max))
     (eval-print-last-sexp)))

 (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
 (el-get 'sync)

 (desktop-save-mode 1)

 (require 'web-mode) 
 (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode)) 
 (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode)) 
 (add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode)) 
 (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode)) 
 (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode)) 
 (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode)) 
 (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
 (add-to-list 'auto-mode-alist '("\\.ftl\\'" . web-mode))

 (setq org-agenda-files (list "~/org/thesis.org"
                         "~/org/esponda.org" 
                         "~/org/private.org"))
 (require 'org)
 (define-key global-map "\C-cl" 'org-store-link)
 (define-key global-map "\C-ca" 'org-agenda)
 (setq org-log-done t)

 (custom-set-variables
  '(initial-frame-alist (quote ((fullscreen . maximized)))))

(setq org-support-shift-select t)

 ;; Set default font to M+
     (add-to-list 'default-frame-alist '(font . "M+ 1mn regular-12" ))

;; Sql truncate line hook
(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)))

;; Sql deafult login to sakai db
(setq sql-mysql-login-params
      '((user :default "root")
        (database :default "sakai")
        (server :default "localhost")
        (port :default 3306)))

(require 'golden-ratio)
(golden-ratio-mode 1)

(setq golden-ratio-exclude-modes '("ediff-mode"
                                   "eshell-mode"
                                   "dired-mode"))
;; should handle dead keys
(require 'iso-transl)

;; intuitive window-switchingb
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

(global-set-key (kbd "<C-kp-prior>") 'previous-buffer)
(global-set-key (kbd "<C-kp-next>") 'next-buffer)


;; save history hook for SQL sessions

(defun my-sql-save-history-hook ()
    (let ((lval 'sql-input-ring-file-name)
          (rval 'sql-product))
      (if (symbol-value rval)
          (let ((filename 
                 (concat "~/.emacs.d/sql/"
                         (symbol-name (symbol-value rval))
                         "-history.sql")))
            (set (make-local-variable lval) filename))
        (error
         (format "SQL history will not be saved because %s is nil"
                 (symbol-name rval))))))
 
  (add-hook 'sql-interactive-mode-hook 'my-sql-save-history-hook) 


;; eclim confs
(require 'eclim)
(global-eclim-mode)

(global-set-key (kbd "<C-tab>") 'company-emacs-eclim)
(global-set-key (kbd "C-#") 'eclim-java-find-declaration)
(global-set-key (kbd "C-x C-y") 'eclim-java-find-declaration)


(require 'eclimd)

 (custom-set-variables
   '(eclim-eclipse-dirs '("~/eclipses/Luna_4.4"))
   '(eclim-executable "~/eclipses/Luna_4.4/eclim")
   '(eclimd-default-workspace "~/workspace-emacs"))

 ;; Displaying compilation error messages in the echo area
 (setq help-at-pt-display-when-idle t)
 (setq help-at-pt-timer-delay 0.1)
 (help-at-pt-set-timer)

 ;; regular auto-complete initialization
;; (require 'auto-complete-config)
;; (ac-config-default)

 ;; add the emacs-eclim source
;; (require 'ac-emacs-eclim-source)
;; (ac-emacs-eclim-config)

 (require 'company)
 (require 'company-emacs-eclim)
 (company-emacs-eclim-setup)
 (global-company-mode t)
 (put 'set-goal-column 'disabled nil)

;; ask if to use VLF when opening large files
(require 'vlf-setup)

 ;; Set your lisp system and, optionally, some contribs
 (setq inferior-lisp-program "/usr/bin/sbcl")
 (setq slime-contribs '(slime-fancy))
 (add-to-list 'slime-contribs 'slime-repl) 

;; Clojure
(require 'package) (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t) (package-initialize) 

(defvar my-packages '(better-defaults
                      projectile
                      clojure-mode
                      cider))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))
