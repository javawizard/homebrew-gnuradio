require 'formula'

class GrOsmosdr < Formula
  version '0.1'
  homepage 'http://sdr.osmocom.org/trac/wiki/GrOsmoSDR'

  option 'with-fcd', 'Build with fcd support'
  option 'with-uhd', 'Build with Ettus USRP support'
  option 'with-iio', 'Build with adi iio support'

  if build.without? 'iio'
    url 'git://git.osmocom.org/gr-osmosdr'
    head 'git://git.osmocom.org/gr-osmosdr'
  else
    url 'git://github.com/csete/gr-osmosdr-gqrx/', :branch => 'plutosdr'
    head 'git://github.com/csete/gr-osmosdr-gqrx/', :branch => 'plutosdr'
  end
  
  depends_on 'cmake' => :build
  depends_on 'gnuradio'
  depends_on 'uhd' => :optional
  depends_on 'librtlsdr' => :optional
  depends_on 'libbladerf' => :optional
  depends_on 'airspy' => :optional
  depends_on 'hackrf' => :optional
  depends_on 'ttrftech/adalm-pluto/gr-iio' => :optional

  def install
    mkdir 'build' do
      args = std_cmake_args
      args << "-DENABLE_FCD=OFF" if build.without? 'fcd'
      args << "-DENABLE_UHD=OFF" if build.without? 'uhd'
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
