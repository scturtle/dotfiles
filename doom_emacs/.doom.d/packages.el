;; -*- no-byte-compile: t; -*-

;; cc
(package! cuda-mode :disable t)
(package! demangle-mode :disable t)
(package! disaster :disable t)
(package! modern-cpp-font-lock :disable t)
(package! opencl-mode :disable t)
(package! glsl-mode :disable t)
(package! company-glsl :disable t)
;; python
(package! anaconda-mode :disable t)
(package! company-anaconda :disable t)
(package! nose :disable t)
(package! python-pytest :disable t)

(package! golden-ratio)

(package! explain-pause-mode
  :recipe (:host github :repo "lastquestion/explain-pause-mode"))

(package! rainbow-mode)

(unpin! t)
