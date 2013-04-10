﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace TankControl.View.ComponentGDA
{
    /// <summary>
    /// Interaction logic for TinyTankR.xaml
    /// </summary>
    public partial class TinyTankR : UserControl
    {
        public BigValveR Bv;

        public TinyTankR()
        {
            InitializeComponent();
            Bv = BigValveR;
        }
    }
}