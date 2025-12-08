using System.Diagnostics;
using System;

namespace p {
    class Program {
        static void Main(String[] args) {
            ProcessStartInfo p = new ProcessStartInfo();
            p.FileName="cmd.exe";
            p.Arguments = "/k C:\\pentet\add.bat";
            p.createNoWindow = true;
            Process.start(p);

            ProcessStartInfo q = new ProcessStartInfo();
            q.FileName="C:\\binary.exe";
            Process u = Process.Start(q);
            u.WaitForExit();
        }
    }
}