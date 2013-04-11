﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TankControl.View.ComponentGDA;

namespace TankControl.Class
{
    public class ShakeValveR : TankControl.Class.Component
    {
        private ShakeValveRComponent view;
        private Guid id;
        private string name;

        public ShakeValveRComponent View
        {
            get
            {
                return this.view;
            }
            set
            {
                this.view = value;
            }
        }

        public Guid Id
        {
            get
            {
                return this.id;
            }
            set
            {
                this.id = value;
            }
        }

        public string Name
        {
            get
            {
                return this.name;
            }
            set
            {
                this.name = value;
            }
        }

        public ShakeValveR(ShakeValveRComponent shakeValve, string name)
        {
            this.Id = new Guid();
            if (name != null)
            {
                this.Name = name;
            }
            if (shakeValve != null)
            {
                this.View = shakeValve;
            }
        }

        public void Run()
        {
            throw new NotImplementedException();
        }

        public void Stop()
        {
            throw new NotImplementedException();
        }

        public bool IsRun()
        {
            throw new NotImplementedException();
        }
    }
}