(require 'package)

(add-hook 'after-init-hook 'after-package-initializations-customizations)
(add-hook 'after-init-hook 'lisp-customizations)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings starter-kit-ruby starter-kit-js zenburn-theme undo-tree cider multiple-cursors expand-region iy-go-to-char key-chord ace-jump-mode multi-term ag company flx-ido projectile align-cljlet clj-refactor)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
(put 'upcase-region 'disabled nil)
