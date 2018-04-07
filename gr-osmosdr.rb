require 'formula'

class GrOsmosdr < Formula
  homepage 'http://sdr.osmocom.org/trac/wiki/GrOsmoSDR'
  url 'git://git.osmocom.org/gr-osmosdr'
  head 'git://git.osmocom.org/gr-osmosdr'

  depends_on 'cmake' => :build
  depends_on 'ttrftech/gnuradio/gnuradio'
  depends_on 'librtlsdr' => :optional
  depends_on 'libbladerf' => :optional
  depends_on 'airspy' => :optional
  depends_on 'hackrf' => :optional

  option 'with-fcd', 'Build with fcd support'
  
  def install
    mkdir 'build' do
      args = std_cmake_args
      args << "-DENABLE_FCD=OFF" if build.without? 'fcd'
      args << "-DPYTHON_LIBRARY=#{python_path}/Frameworks/Python.framework/"
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
