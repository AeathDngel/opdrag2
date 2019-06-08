using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Online_Scheduler
{
    public class Task
    {
        public string name;
        public int start;
        public int time;

        public Task(string paramName, int paramStart, int paramTime)
        {
            SetName(paramName);
            SetStart(paramStart);
            SetTime(paramTime);
        }

        public string GetName()
        {
            return name;
        }

        public void SetName(string name)
        {
            this.name = name;
        }

        public int GetStartTime()
        {
            return start;
        }

        public void SetStart(int p_start)
        {
            start = p_start;
        }

        public int GetTime()
        {
            return time;
        }

        public void SetTime(int p_time)
        {
            time = p_time;
        }
    }
}