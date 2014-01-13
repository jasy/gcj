using System;
using System.Collections.Generic;
using System.Linq;

class GCJ
{
    static void Main(){ new GCJ().Run(); }
    void Run()
    {
        foreach(var i in Enumerable.Range(1,int.Parse(Console.ReadLine())))
            Console.WriteLine("Case #"+i+": "+Solve());
    }
    string Solve()
    {
        return 0.0.ToString("F6");
    }
}
