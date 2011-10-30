
Content = <<'DATA'
<!DOCTYPE html>
<html>
  <head>
    <link href='vendor/deck.js/themes/style/swiss.css' rel='stylesheet' />
    <link href='vendor/deck.js/themes/transition/horizontal-slide.css' rel='stylesheet' />
    <link href='base.css' rel='stylesheet' />
    <link href='http://fonts.googleapis.com/css?family=Josefin+Sans' rel='stylesheet' />
    <link href='http://fonts.googleapis.com/css?family=Quattrocento+Sans' rel='stylesheet' />
  </head>
  <body>
    <div class='deck-container'>
      <div class='slide big-title'>
        <h2>JRuby</h2>
        <h3>Una introducción muy breve</h3>
        <div class='big img'>jruby.png</div>
      </div>
      <div class='slide'>
        <h2>Qué es JRuby</h2>
        Implementación de Ruby en Java
        <ul>
          <li class='slide'>Ejecutar Ruby sobre la JVM</li>
          <li class='slide'>Usar Java desde Ruby</li>
          <li class='slide'>Usar Ruby desde Java</li>
        </ul>
        <div class='big-quote slide'>
          JRuby es un universo por sí solo
        </div>
      </div>
      <div class='slide'>
        <h2>No sólo una mezcla</h2>
        <i>El todo es mayor que la suma de las partes</i>
        <div class='big img'>components.svg</div>
      </div>
      <div class='slide'>
        <h2>Historia</h2>
        <ul>
          <li>2001 ⇝ empezado por Arne Petersen</li>
          <li>2006 ⇝ Thomas Enebo y Charles Nutter en <u>Sun Microsystems</u></li>
          <li>2007 ⇝ Ola Bini en <u>ThoughtWorks</u></li>
          <li>2009 ⇝ Charles Nutter, Thomas Enebo y Nick Sieger en <u>Engine Yard</u></li>
        </ul>
      </div>
      <div class='slide'>
        <h2>Por qué JRuby</h2>
        <ul>
          <li class='slide'>Java</li>
          <li class='slide'>JVM</li>
        </ul>
      </div>
      <div class='slide'>
        <h2>Java</h2>
        <h3>Cultura de rechazo</h3>
        <div class='big img'>haters.jpeg</div>
      </div>
      <div class='slide'>
        <h2>Qué aporta Java a Ruby</h2>
        <ul>
          <li class='slide'>Librerías y herramientas</li>
          <li class='slide'>Velocidad</li>
          <li class='slide'>Gestión de memoria</li>
        </ul>
      </div>
      <div class='slide'>
        <h2>JVM</h2>
        <h3>Quizá, la mejor VM a día de hoy</h3>
        <div class='slide'>
          <div class='autolink'>http://blog.heroku.com/archives/2011/08/25/java/</div>
          <ul>
            <li>The JVM is one of the best runtime VMs in the world, offering fast performance and a reliable memory footprint over time.</li>
          </ul>
        </div>
      </div>
      <div class='slide'>
        <h2>Algunos puntos sobre JVM</h2>
        <ul>
          <li class='slide'>Gestión de memoria - GC</li>
          <li class='slide'>JIT</li>
          <li class='slide'>Hilos</li>
          <li class='slide'>Tunning</li>
        </ul>
      </div>
      <div class='slide'>
        <h2>Gestión de memoria: Tipos</h2>
        <ul>
          <li class='slide'>Manualmente</li>
          <li class='slide'>Por referencias (Python)</li>
          <li class='slide'>GC (Ruby)</li>
        </ul>
      </div>
      <div class='slide'>
        <h2>Manualmente</h2>
        <ul>
          <li>
            <tt>malloc</tt>
            y
            <tt>free</tt>
          </li>
        </ul>
      </div>
      <div class='slide'>
        <h2>Por referencias</h2>
        <ul>
          <li class='slide'>Cada objeto tiene un contador (inicialmente 1)</li>
          <li class='slide'>Incrementa y decrementa según se use el objeto</li>
          <li class='slide'>Cuando llega a cero se borra el objeto</li>
        </ul>
      </div>
      <div class='slide'>
        <h2>Referencias: Ejemplo</h2>
        <b>Python</b>
        <pre class='slide'>a = SomeClass()       # R = 1</pre>
        <pre class='slide'>b = [a]               # R = 2</pre>
        <div class='slide only-on-current'>
          <div class='img'>python-example-refs.png</div>
        </div>
        <pre class='slide'>a = None              # R = 1</pre>
        <div class='slide only-on-current'>
          <div class='img'>python-example-refs-2.png</div>
        </div>
        <pre class='slide'>b.pop()               # R = 0 ⇒ Se borra</pre>
      </div>
      <div class='slide'>
        <h2>Referencias: Ventajas sobre GC</h2>
        <ul>
          <li class='slide'>Objetos borrados inmediatamente</li>
          <li class='slide'>Sin ciclos de búsqueda de basura</li>
        </ul>
      </div>
      <div class='slide'>
        <h2>Referencias: Desventajas sobre GC</h2>
        <ul>
          <li class='slide'>Complejidad alta (en extensiones C)</li>
          <li class='slide'>Referencias cruzadas</li>
        </ul>
      </div>
      <div class='slide'>
        <h2>Referencias cruzadas</h2>
        <pre>a = []
b = [a]
a.append(b)
del a, b</pre>
        <ul>
          <li class='slide'>Las dos listas quedan inaccesibles, con su contador a 1</li>
          <li class='slide'>Hay herramientas de evitar la fuga de memoria</li>
          <li class='slide'><tt>weakref</tt> y <tt>gc</tt> en Python</li>
        </ul>
        <div class='big img'>python-self-refs.png</div>
      </div>
      <div class='slide'>
        <h2>Garbage Collector</h2>
        <h3>Gestión <i>automágica</i> de objetos</h3>
        <ul>
          <li class='slide'><i>rootset</i> con los objetos base del programa</li>
          <li class='slide'>Cada objeto indica los objetos que contiene</li>
          <li class='slide'>El GC busca todos los objetos que son alcanzables desde el <i>rootset</i></li>
          <li class='slide'>Los que no se vean se borran</li>
        </ul>
      </div>
      <div class='slide gc-example'>
        <h2>GC: Ejemplo</h2>
        <div class='big img first-status'>gc-1.png</div>
        <div class='big img second-status'>gc-2.png</div>
        <i>RootSet</i>: variables locales
        <pre>a = ["foo"]<br>b = 11<br>GC.start</pre>
        <pre class='slide'>a = "bar" <br>GC.start</pre>
      </div>
      <div class='slide'>
        <h2>GC: Ventajas</h2>
        <ul>
          <li class='slide'>Poca complejidad para usarlo</li>
          <li class='slide'>No hay fugas de memoria...</li>
          <li class='slide'>... pero sí <i>fugas lógicas</i></li>
        </ul>
      </div>
      <div class='slide'>
        <h2>GC: Desventajas</h2>
        <ul>
          <li class='slide'>Tiempo CPU en buscar basura</li>
          <li class='slide'>Acumulación de objetos sin uso</li>
        </ul>
      </div>
      <div class='slide'>
        <h2>Fugas lógicas</h2>
        <ul>
          <li class='slide'>Objetos referenciados accidentalmente</li>
          <li class='slide'>La memoria ocupada no se libera, aunque no se use</li>
        </ul>
        <pre class='slide'>def create_layout
  x = '...'
  ...
  window.bind 'close' do
    # x está visible, aunque no se use
    exit
  end
end</pre>
      </div>
      <div class='slide'>
        <h2>Fugas lógicas: Ejemplo en Ruby</h2>
        <script src="https://gist.github.com/1294176.js?file=test_strings.rb"></script>
      </div>
      <div class='slide'>
        <h2>Fugas lógicas: Ejemplo en Ruby: Resultado</h2>
        <script src="https://gist.github.com/1294176.js?file=gistfile1.txt"></script>
      </div>
      <div class='slide'>
        <h2>GC en la JVM</h2>
        <ul>
          <li class='slide'>
            Diferentes tipos de GC, según necesidades
            <ul>
              <li>Fast Allocation</li>
              <li>Serial Collector</li>
              <li>Parallel Collector</li>
              <li>Parallel Compacting Collector</li>
              <li>Concurrent Mark-Sweep (CMS) Collector</li>
            </ul>
            <p>
              <div class='autolink'>http://java.sun.com/j2se/reference/whitepapers/memorymanagement_whitepaper.pdf</div>
            </p>
          </li>
          <li class='slide'>
            Ruby
            <ul>
              <li>
                <div class='autolink'>http://engineering.twitter.com/2011/03/building-faster-ruby-garbage-collector.html</div>
              </li>
              <li>
                <div class='autolink'>http://jabberwocky.eu/2010/09/03/ruby-garbage-collection/</div>
              </li>
            </ul>
          </li>
        </ul>
      </div>
      <div class='slide'>
        <h2>JIT</h2>
        <ul>
          <li class='slide'>Compilador <i>Just In Time</i></li>
          <li class='slide'>Genera código máquina según de patrones de <i>bytecode</i></li>
        </ul>
        <div class='slide'>
          <div class='autolink'>https://gist.github.com/1292948</div>
        </div>
      </div>
      <div class='slide'>
        <h2>Hilos (<i>thredas</i>)</h2>
        <ul>
          <li class='slide'>MRI 1.8 <i>green threads</i></li>
          <li class='slide'>MRI 1.9 <i>native threads</i>, pero con GIL</li>
          <li class='slide'>JVM <i>native threads</i> concurrentes</li>
        </ul>
      </div>
      <div class='slide'>
        <h2>Ventajas de hilos concurrente</h2>
        <ul>
          <li class='slide'>Se aprovecha <i>multicores</i></li>
          <li class='slide'>Concurrencia más ligera que múltiples procesos</li>
          <li class='slide'>Bloqueo de I/O gestionada por el núcleo</li>
        </ul>
      </div>
      <div class='slide'>
        <h2>Impacto de hilos en velocidad</h2>
        <p>
          <div class='autolink'>https://gist.github.com/1284522</div>
        </p>
      </div>
      <div class='slide'>
        <h2>Tuning</h2>
        <div class='big img'>tunning.jpeg</div>
      </div>
      <div class='slide multi-list'>
        <h2>JVM Configurable</h2>
        <ul>
          <li class='slide'>∞ opciones en línea de órdenes (<i>no runtime</i>)</li>
          <li class='slide'>
            <b>Gestión de memoria</b>
            <ul>
              <li><tt>-Xms</tt> tamaño inicial del <i>heap</i></li>
              <li><tt>-Xmx</tt> tamaño máximo del <i>heap</i></li>
              <li><tt>-Xss</tt> tamaño de la pila por hilo (llamdas recursivas, etc)</li>
            </ul>
          </li>
          <li class='slide'>
            <b>GC</b>
            <ul>
              <li>
                <tt>-XX:+UseConcMarkSweepGC,</tt>
                <tt>-XX:+UseSerialGC,</tt>
                <tt>-XX:+UseParNewGC</tt>
                selecciona un tipo de GC
              </li>
              <li>
                <tt>-XX:GCTimeRatio=2</tt>
                <tt>-XX:ParallelGCThreads=8</tt>
                <tt>-XX:MaxGCPauseMillis=2000</tt>
                <tt>-XX:+DisableExplicitGC</tt>
              </li>
              <li>
                <tt>-XX:+PrintGCDetails</tt>
                <tt>-XX:+PrintGCTimeStamps</tt>
              </li>
            </ul>
          </li>
        </ul>
      </div>
      <div class='slide multi-list'>
        <h2>JVM Configurable (2)</h2>
        <ul>
          <li class='slide'>
            <b>JIT</b>
            <ul>
              <li>
                <tt>-XX:CompileThreshold=10000</tt>
              </li>
              <li>
                <tt>-XX:AllocatePrefetchLines=1</tt>
              </li>
            </ul>
          </li>
          <li class='slide'>
            <b>Depuración</b>
            <ul>
              <li>
                <tt>-XX:OnError="cmd args"</tt>
              </li>
              <li>
                <tt>-XX:OnOutOfMemoryError="cmd args"</tt>
              </li>
              <li>
                <tt>-XX:HeapDumpPath=filename.hprof</tt>
              </li>
              <li>
                <tt>-XX:-PrintClassHistogram</tt>
              </li>
              <li>
                <tt>-XX:-PrintCompilation</tt>
              </li>
              <li>
                <tt>-XX:-PrintClassHistogram</tt>
              </li>
            </ul>
          </li>
        </ul>
      </div>
      <div class='slide'>
        <h2>Compatibilidad con MRI</h2>
        <ul>
          <li class='slide'>Implementación fiel a 1.8 y 1.9</li>
          <li class='slide'>
            <tt>$ jruby script.rb</tt>
            usa 1.8
          </li>
          <li class='slide'>
            <tt>$ jruby --1.9 script.rb</tt>
            usa 1.9
          </li>
        </ul>
      </div>
      <div class='slide'>
        <h2>MRI-like</h2>
        <li class='slide'>
          <b>Ventaja</b>
          <ul>
            <li>Casi todo funciona <i>out-the-box</i></li>
          </ul>
        </li>
        <li class='slide'>
          <b>Desventajas</b>
          <ul>
            <li>
              Arrastra limitaciones propias de MRI
              <table>
                <tr>
                  <td>Rubinius</td>
                  <td>☺</td>
                  <td>Ruby</td>
                  <td>♥ ♥ ♥</td>
                </tr>
                <tr>
                  <td>JRuby</td>
                  <td>☺</td>
                  <td>Java</td>
                  <td>♥ ♥</td>
                </tr>
                <tr>
                  <td>MRI</td>
                  <td>☹</td>
                  <td>C</td>
                  <td>☢</td>
                </tr>
              </table>
            </li>
          </ul>
        </li>
      </div>
      <div class='slide'>
        <h2>Extensiones en C</h2>
        <ul>
          <li class='slide'>
            FFI integrado
            <p>
              <div class='autolink'>https://github.com/reynhout/callme/tree/master/FFI_lib</div>
            </p>
          </li>
          <li class='slide'>
            Emulación API MRI
            <ul>
              <li>
                <div class='autolink'>http://blog.headius.com/2010/07/what-jruby-c-extension-support-means-to.html</div>
              </li>
              <li>Pesada. Conviene evitarla.</li>
            </ul>
          </li>
        </ul>
      </div>
      <div class='slide'>
        <h2>Extensiones en C - Falta de API</h2>
        <div class='autolink'>https://twitter.com/#!/headius/statuses/111557192712339457</div>
        <div class='big img'>mri-not-api.png</div>
      </div>
      <div class='slide'>
        <h2>Extensiones en C - Falta de API (2)</h2>
        <p>
          JRuby/Rubinius buscan una API común con MRI
        </p>
        <p>
          <div class='autolink'>http://twitter.theinfo.org/118968409890365441</div>
        </p>
        <div class='big img'>common-api.png</div>
      </div>
      <div class='slide'>
        <h2>Uso de librerías en Java</h2>
        <ul>
          <li>Paquetes JARs</li>
          <li>
            <tt>java_import</tt>
            y derivados
          </li>
        </ul>
      </div>
      <div class='slide'>
        <h2>JAR</h2>
        <ul>
          <li class='slide'>Paquete comprimido (ZIP) con ficheros compilados (<tt>Foo.class</tt>) y recursos</li>
          <li class='slide'>Algo similar a las gemas en Ruby</li>
          <li class='slide'>
            Clases accesibles con
            <tt>require "path/to/file.jar"</tt>
          </li>
          <li class='slide'>
            Ejemplo para usar Jython:
            <div class='autolink'>https://gist.github.com/1285653</div>
          </li>
        </ul>
      </div>
      <div class='slide'>
        <h2>Acceso a las clases</h2>
        <ul>
          <li class='slide'>
            <tt>require 'java'</tt>
            necesario
          </li>
          <li class='slide'>
            <pre>java_import "org.python.core.PyString"<br>obj = PyString.new</pre>
            <i>equivale a</i>
            <pre>obj = Java::org.python.core.PyString.new</pre>
          </li>
          <li class='slide'>
            <tt>include_package "org.python.core"</tt>
            hace accesible todas las clases (via <tt>const_missing</tt>)
            <pre>module Python::Core
  include_package "org.python.core"
  # ...
end

obj = Python::Core::PyString.new</pre>
          </li>
        </ul>
      </div>
      <div class='slide'>
        <h2>Datos Java ⇔ Ruby</h2>
        <ul>
          <li class='slide'>Conversión de tipos (<tt>RubyNumeric</tt> a <tt>Integer</tt>, <tt>RubyString</tt> a <tt>String</tt>, etc)</li>
          <li class='slide'>Bloques como clases anónimas. Interfaces inferidas.</li>
        </ul>
      </div>
      <div class='slide'>
        <h2>Mirah</h2>
        <ul>
          <li class='slide'>
            <i>Rubí</i>
            en Javanés (zonas de Indonesia, Malasia, etc)
          </li>
          <li class='slide'>Sintaxis de Ruby</li>
          <li class='slide'>Genera <i>bytecode</i> de Java</li>
          <li class='slide'>Ningún añadido sobre el <i>runtime</i> Java</li>
        </ul>
      </div>
      <div class='slide'>
        <h2>Mirah: Código</h2>
        <script src="https://gist.github.com/1291717.js?file=SomeMath.mirah"></script>
      </div>
      <div class='slide'>
        <h2>Mirah: Uso</h2>
        <script src="https://gist.github.com/1291717.js?file=gistfile1.txt"></script>
      </div>
      <div class='slide'>
        <h2>Mirah: Comparación código Mirah - Java</h2>
        <div class='autolink'>https://gist.github.com/1291717#file_some_math.java</div>
      </div>
      <div class='slide'>
        <h2>Mirah: Fibonacci</h2>
        <div class='autolink'>https://gist.github.com/1291791</div>
      </div>
      <div class='slide'>
        <h2>warbler</h2>
        <div class='autolink'>http://caldersphere.rubyforge.org/warbler/</div>
        <p>Warbler is a gem to make a Java jar or war file out of any Ruby, Rails, Merb, or Rack application. Warbler provides a minimal, flexible, Ruby-like way to bundle up all of your application files for deployment to a Java environment.</p>
        <ul>
          <li>Crea <tt>.war</tt></li>
          <li>Paquetes ejecutables (<tt>java -jar foo.war</tt>)</li>
          <li>Precompila <tt>jrubyc</tt> (mejora tiempo de carga)</li>
        </ul>
      </div>
      <div class='slide'>
        <h2>Análisis</h2>
        Herramientas para analizar procesos en marcha
      </div>
      <div class='slide'>
        <h2>VisualVM</h2>
        <pre>$ apt-cache show visualvm
...

VisualVM is designed for
 - Application Developers: Monitor, profile, take thread dumps,
   browse heap dumps.
 - System Administrators: Monitor and control Java applications
   across the entire network.
 - Java Application Users: Create bug reports containing all the
   necessary information.</pre>
      </div>
      <div class='slide'>
        <h2>VisualVM (1)</h2>
        <div class='big img'>visualvm-monitor.png</div>
      </div>
      <div class='slide'>
        <h2>VisualVM (2)</h2>
        <div class='big img'>visualvm-threads.png</div>
      </div>
      <div class='slide'>
        <h2>jconsole</h2>
        Similar al VisualVM
        <div class='big img'>jconsole-1.png</div>
      </div>
      <div class='slide'>
        <h2>jconsole (2)</h2>
        <div class='big img'>jconsole-2.png</div>
      </div>
      <div class='slide'>
        <h2>jconsole (3)</h2>
        <div class='big img'>jconsole-3.png</div>
      </div>
      <div class='slide'>
        <h2>jmap</h2>
        <ul>
          <li class='slide'>Información sobre la memoria de un proceso</li>
          <li class='slide'>
            <tt>man jmap</tt>
          </li>
        </ul>
        <pre class='slide smaller'>$ irb
jruby-1.6.4 :001 &gt; $$
 =&gt; 3862 

$ jmap -histo 3862

 num     #instances         #bytes  class name
----------------------------------------------
   1:         28312        4865216  constMethodKlass
   2:         28312        3858912  methodKlass
   3:          3442        3003224  constantPoolKlass
   4:          3442        3001808  instanceKlassKlass
...
  10:          3648         428464  java.lang.Class
  11:          8727         279264  java.lang.String
...
  20:           347          55520  org.jruby.MetaClass
  21:           322          51520  org.jruby.RubyClass
...
2547:             1             16  org.jruby.parser.DefaultRubyParser$216
2548:             1             16  org.jruby.parser.DefaultRubyParser$256
Total        160785       22213840</pre>
      </div>
      <div class='slide'>
        <h2>jhat - Java Heap Analysis Tool</h2>
        <ul>
          <li class='slide'>
            Análisis de un volcado de memoria
            <ul>
              <li>
                <tt>-XX:+HeapDumpOnOutOfMemoryError</tt>
              </li>
              <li>
                <tt>jmap -dump</tt>
              </li>
              <li>...</li>
            </ul>
          </li>
          <li class='slide'>
            Servidor web que muestra resultados
            <p>
              <div class='autolink'>http://www.engineyard.com/blog/2010/monitoring-memory-with-jruby-part-1-jhat-and-visualvm/</div>
            </p>
            <div class='img'>jhat.png</div>
          </li>
        </ul>
      </div>
      <div class='slide'>
        <h2>Misc</h2>
        <ul>
          <li class='slide'>
            <tt>jdb</tt>
          </li>
          <li class='slide'>
            <tt>jps</tt>
          </li>
          <li class='slide'>
            <tt>jstat</tt>
            (GC, compilador JIT, clases, ...)
          </li>
          <li class='slide'>
            <tt>jstack</tt>
          </li>
          <li class='slide'>...</li>
        </ul>
      </div>
    </div>
  </body>
</html>
<script src='vendor/jquery.js'></script>
<script src='vendor/deck.js/modernizr.custom.js'></script>
<script src='vendor/deck.js/core/deck.core.js'></script>
<script src='vendor/deck.js/extensions/menu/deck.menu.js'></script>
<script src='vendor/deck.js/extensions/goto/deck.goto.js'></script>
<script src='vendor/deck.js/extensions/status/deck.status.js'></script>
<script src='vendor/deck.js/extensions/hash/deck.hash.js'></script>
<script type='text/javascript'>
  //<![CDATA[
    $(function() {
    
      /* Auto content */
      $(".img").each(function() {
        var node = $(this);
        var img = $("<img>", {src: "images/" + node.text()});
        node.html("").append(img);
      });
    
      $(".autolink").each(function() {
        var node = $(this);
        node.replaceWith($("<a>", {href: node.text(), text: node.text(), target: "_blank"}));
      });
    
      var container = $(".deck-container");
      container.hide();
      $.deck('.slide');
      container.show();
    });
  //]]>
</script>
DATA

class App < Sinatra::Base
  get "/" do
    Content
  end
end

