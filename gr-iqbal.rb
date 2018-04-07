require 'formula'

class GrIqbal < Formula
  homepage 'http://sdr.osmocom.org/trac/wiki/GrOsmoSDR'
  # Use git tag instead of the tarball to get submodules
  url 'git://git.osmocom.org/gr-iqbal',
    :tag => "v0.37.2",
    :revision => "d4fd4dd41ead825a25729021023dda3db51d8b85"
  head 'git://git.osmocom.org/gr-iqbal'

  depends_on 'cmake' => :build
  depends_on 'ttrftech/gnuradio/gnuradio'

  patch :DATA

  def install
    mkdir 'build' do
      args = std_cmake_args
      system 'cmake', '..', *args
      system 'make'
      system 'make install'
    end
  end

  def python_path
    python = Formulary.factory('python')
    kegs = python.rack.children.reject { |p| p.basename.to_s == '.DS_Store' }
    kegs.find { |p| Keg.new(p).linked? } || kegs.last
  end
end

__END__
diff --git a/libosmo-dsp/include/osmocom/dsp/cfile.h b/libosmo-dsp/include/osmocom/dsp/cfile.h
index be9392e..eab9996 100644
--- a/libosmo-dsp/include/osmocom/dsp/cfile.h
+++ b/libosmo-dsp/include/osmocom/dsp/cfile.h
@@ -33,7 +33,7 @@
  *  \brief Osmocom .cfile helpers header
  */
 
-#include <complex.h>
+#include "/usr/include/complex.h"
 
 /*! \brief Structure representing a currently mapped .cfile */
 struct cfile {
diff --git a/libosmo-dsp/include/osmocom/dsp/cxvec.h b/libosmo-dsp/include/osmocom/dsp/cxvec.h
index 063e30c..5adc771 100644
--- a/libosmo-dsp/include/osmocom/dsp/cxvec.h
+++ b/libosmo-dsp/include/osmocom/dsp/cxvec.h
@@ -33,7 +33,7 @@
  *  \brief Osmocom Complex vectors header
  */
 
-#include <complex.h>
+#include "/usr/include/complex.h"
 
 #define CXVEC_FLG_REAL_ONLY	(1<<0)	/*!< \brief Real values only */
 
diff --git a/libosmo-dsp/include/osmocom/dsp/cxvec_math.h b/libosmo-dsp/include/osmocom/dsp/cxvec_math.h
index 7e372c4..fa045b7 100644
--- a/libosmo-dsp/include/osmocom/dsp/cxvec_math.h
+++ b/libosmo-dsp/include/osmocom/dsp/cxvec_math.h
@@ -34,7 +34,7 @@
  *  \brief Osmocom Complex vectors math header
  */
 
-#include <complex.h>
+#include "/usr/include/complex.h"
 #include <math.h>
 
 #include <osmocom/dsp/cxvec.h>
diff --git a/libosmo-dsp/include/osmocom/dsp/iqbal.h b/libosmo-dsp/include/osmocom/dsp/iqbal.h
index c7f7e60..5b2b037 100644
--- a/libosmo-dsp/include/osmocom/dsp/iqbal.h
+++ b/libosmo-dsp/include/osmocom/dsp/iqbal.h
@@ -33,7 +33,7 @@
  *  \brief Osmocom IQ balance utils header
  */
 
-#include <complex.h>
+#include "/usr/include/complex.h"
 
 #include <osmocom/dsp/cxvec.h>
 
diff --git a/libosmo-dsp/src/cfile.c b/libosmo-dsp/src/cfile.c
index 4fa927f..beae845 100644
--- a/libosmo-dsp/src/cfile.c
+++ b/libosmo-dsp/src/cfile.c
@@ -30,7 +30,7 @@
  *  \brief Osmocom .cfile helpers implementation
  */
 
-#include <complex.h>
+#include "/usr/include/complex.h"
 #include <fcntl.h>
 #include <stdio.h>
 #include <stdlib.h>
diff --git a/libosmo-dsp/src/cxvec.c b/libosmo-dsp/src/cxvec.c
index fcda8af..f6f0a9b 100644
--- a/libosmo-dsp/src/cxvec.c
+++ b/libosmo-dsp/src/cxvec.c
@@ -30,7 +30,7 @@
  *  \brief Osmocom Complex vectors implementation
  */
 
-#include <complex.h>
+#include "/usr/include/complex.h"
 #include <math.h>
 #include <stdio.h>
 #include <stdlib.h>
diff --git a/libosmo-dsp/src/cxvec_math.c b/libosmo-dsp/src/cxvec_math.c
index 64e2d1b..24ecb58 100644
--- a/libosmo-dsp/src/cxvec_math.c
+++ b/libosmo-dsp/src/cxvec_math.c
@@ -30,7 +30,7 @@
  *  \brief Osmocom Complex vectors math implementation
  */
 
-#include <complex.h>
+#include "/usr/include/complex.h"
 #include <math.h>
 #include <stdio.h>
 #include <stdlib.h>
diff --git a/libosmo-dsp/src/iqbal.c b/libosmo-dsp/src/iqbal.c
index e5432f9..f62db05 100644
--- a/libosmo-dsp/src/iqbal.c
+++ b/libosmo-dsp/src/iqbal.c
@@ -40,7 +40,7 @@
  *   - Optimization based on steepest gradient with dynamic step size
  */
 
-#include <complex.h>
+#include "/usr/include/complex.h"
 #include <stdlib.h>
 #include <string.h>
 
