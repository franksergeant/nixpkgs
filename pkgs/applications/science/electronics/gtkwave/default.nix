{ stdenv, fetchurl, glib, gtk3, gperf, pkgconfig, bzip2, tcl, tk, wrapGAppsHook, judy, xz }:

stdenv.mkDerivation rec {
  pname = "gtkwave";
  version = "3.3.107";

  src = fetchurl {
    url    = "mirror://sourceforge/gtkwave/${pname}-gtk3-${version}.tar.gz";
    sha256 = "0ma30jyc94iid3v3m8aw4i2lyiqfxkpsdvdmmaibynk400cbzivl";
  };

  nativeBuildInputs = [ pkgconfig wrapGAppsHook ];
  buildInputs = [ glib gtk3 gperf bzip2 tcl tk judy xz ];

  configureFlags = [
    "--with-tcl=${tcl}/lib"
    "--with-tk=${tk}/lib"
    "--enable-judy"
    "--enable-gtk3"
  ];

  meta = {
    description = "VCD/Waveform viewer for Unix and Win32";
    homepage    = "http://gtkwave.sourceforge.net";
    license     = stdenv.lib.licenses.gpl2Plus;
    maintainers = with stdenv.lib.maintainers; [ thoughtpolice ];
    platforms   = stdenv.lib.platforms.linux;
  };
}
