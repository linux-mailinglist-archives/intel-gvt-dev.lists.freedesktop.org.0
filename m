Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2696822061F
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Jul 2020 09:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1676E46B;
	Wed, 15 Jul 2020 07:23:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687E06E46B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Jul 2020 07:23:54 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id x9so1144893ila.3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Jul 2020 00:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iVI9OEi15ucgF+g8KcXMdUgFoTPpFbhlrX4hmZLnLRA=;
 b=hXi3lq/PYvPejiJDwHppBjJ1qQACESfwwvsxhlSxeJDCiWfGeT0bckB613seWRQba/
 sTvlimxF7JxaBYc5ZuA8iXKjV/72zDV4aO2LBQLys9xk5O6s9ckzcGqZhWr/vb2pI3aH
 p18h72+O+M08CrtVCMUSEACVB84Gj5E/Y+i9Ln9aoAEdvDka9wfCjVrxcQ7izDaRD1mi
 k3eGqiM+CHNqQnzSyG+NZFNE1epVl2IMgazzDswqrWZJHpWL57LvnHneeAFVL69z7MEz
 33f1uXItnU+GpOcRXnFAhcJNW7kXPHbeRALFGRYItYqS/Ry0a2quh6rA+gZOFETiVGRL
 GwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iVI9OEi15ucgF+g8KcXMdUgFoTPpFbhlrX4hmZLnLRA=;
 b=mtX+dZ/gRq1aTMhfm+HSUil46FxpimgFZaKqiA5pTrPLnMm9vExNow9KiaFSwUaxbO
 3a5Kc3G82HEd7Y0CSrgPgRgwsy7urOqYPR6qdCYNa3J28Y4A6M/AF4VCvgCGPYlvJCaK
 GhfKORPoUFj95yo498L+WS1satRQq0gAfwmyqeaobAgHvtiXySdMEVJiM59q1q+1Jx9D
 3ySBs4q1Py/SaoM06lgpgHIc8WlnWtDZEBma+TxASiwQybBBFFz9xGM8/oapqSBpeRtv
 /2Wl1e5831IYfCP8FuR1QJXwRWaFv6DKtb1Dms/PugYthGRnmrQySa57vJzYTnf4BTA6
 eVcg==
X-Gm-Message-State: AOAM5323Mhzz6po/WI4qmCFRLKjeVRvUTP5qcOmZrEEqPruwOHzDvfr9
 toRQvwVcmSTB2CdydBJJEfCrWGlePq60cHe60gM=
X-Google-Smtp-Source: ABdhPJyq827fJkM7uE904D7wZUH3bEyTHy1LgFjmrX7ip5QaBhrdUlZ4BC1QOhhgM3Gp/e11NzzPPsGxH6U7tUwD1VU=
X-Received: by 2002:a92:c78d:: with SMTP id c13mr8710235ilk.85.1594797833754; 
 Wed, 15 Jul 2020 00:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200713232957.GD5955@joy-OptiPlex-7040>
 <20200714102129.GD25187@redhat.com>
 <20200714101616.5d3a9e75@x1.home>
In-Reply-To: <20200714101616.5d3a9e75@x1.home>
From: Alex Xu <soulxu@gmail.com>
Date: Wed, 15 Jul 2020 15:23:42 +0800
Message-ID: <CAH7mGav5vYVhubYm_M8X+xzQDxMF+9DkwRqS=Aei0_bkDGMRYw@mail.gmail.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
To: Alex Williamson <alex.williamson@redhat.com>
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kvm@vger.kernel.org, libvir-list@redhat.com, qemu-devel@nongnu.org,
 kwankhede@nvidia.com, eauger@redhat.com, "Wang,
 Xin-ran" <xin-ran.wang@intel.com>, corbet@lwn.net,
 openstack-discuss <openstack-discuss@lists.openstack.org>,
 shaohe.feng@intel.com, kevin.tian@intel.com, Yan Zhao <yan.y.zhao@intel.com>,
 eskultet@redhat.com, "Ding, Jian-feng" <jian-feng.ding@intel.com>,
 dgilbert@redhat.com, zhenyuw@linux.intel.com, "Xu, Hejie" <hejie.xu@intel.com>,
 bao.yumeng@zte.com.cn, Sean Mooney <smooney@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, cohuck@redhat.com,
 dinechin@redhat.com, devel@ovirt.org
Content-Type: multipart/mixed; boundary="===============0004512583=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============0004512583==
Content-Type: multipart/alternative; boundary="0000000000005e9f7d05aa75ce78"

--0000000000005e9f7d05aa75ce78
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alex Williamson <alex.williamson@redhat.com> =E4=BA=8E2020=E5=B9=B47=E6=9C=
=8815=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=8812:16=E5=86=99=E9=81=93=
=EF=BC=9A

> On Tue, 14 Jul 2020 11:21:29 +0100
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>
> > On Tue, Jul 14, 2020 at 07:29:57AM +0800, Yan Zhao wrote:
> > > hi folks,
> > > we are defining a device migration compatibility interface that helps
> upper
> > > layer stack like openstack/ovirt/libvirt to check if two devices are
> > > live migration compatible.
> > > The "devices" here could be MDEVs, physical devices, or hybrid of the
> two.
> > > e.g. we could use it to check whether
> > > - a src MDEV can migrate to a target MDEV,
> > > - a src VF in SRIOV can migrate to a target VF in SRIOV,
> > > - a src MDEV can migration to a target VF in SRIOV.
> > >   (e.g. SIOV/SRIOV backward compatibility case)
> > >
> > > The upper layer stack could use this interface as the last step to
> check
> > > if one device is able to migrate to another device before triggering =
a
> real
> > > live migration procedure.
> > > we are not sure if this interface is of value or help to you. please
> don't
> > > hesitate to drop your valuable comments.
> > >
> > >
> > > (1) interface definition
> > > The interface is defined in below way:
> > >
> > >              __    userspace
> > >               /\              \
> > >              /                 \write
> > >             / read              \
> > >    ________/__________       ___\|/_____________
> > >   | migration_version |     | migration_version |-->check migration
> > >   ---------------------     ---------------------   compatibility
> > >      device A                    device B
> > >
> > >
> > > a device attribute named migration_version is defined under each
> device's
> > > sysfs node. e.g.
> (/sys/bus/pci/devices/0000\:00\:02.0/$mdev_UUID/migration_version).
> > > userspace tools read the migration_version as a string from the sourc=
e
> device,
> > > and write it to the migration_version sysfs attribute in the target
> device.
> > >
> > > The userspace should treat ANY of below conditions as two devices not
> compatible:
> > > - any one of the two devices does not have a migration_version
> attribute
> > > - error when reading from migration_version attribute of one device
> > > - error when writing migration_version string of one device to
> > >   migration_version attribute of the other device
> > >
> > > The string read from migration_version attribute is defined by device
> vendor
> > > driver and is completely opaque to the userspace.
> > > for a Intel vGPU, string format can be defined like
> > > "parent device PCI ID" + "version of gvt driver" + "mdev type" +
> "aggregator count".

> >
> > > for an NVMe VF connecting to a remote storage. it could be
> > > "PCI ID" + "driver version" + "configured remote storage URL"
>

If the "configured remote storage URL" is something configuration setting
before the usage, then it isn't something we need for migration compatible
check. Openstack only needs to know the target device's driver and hardware
compatible for migration, then the scheduler will choose a host which such
device, and then Openstack will pre-configure the target host and target
device before the migration, then openstack will configure the correct
remote storage URL to the device. If we want, we can do a sanity check
after the live migration with the os.


> > >
> > > for a QAT VF, it may be
> > > "PCI ID" + "driver version" + "supported encryption set".
> > >
> > > (to avoid namespace confliction from each vendor, we may prefix a
> driver name to
> > > each migration_version string. e.g. i915-v1-8086-591d-i915-GVTg_V5_8-=
1)
>
> It's very strange to define it as opaque and then proceed to describe
> the contents of that opaque string.  The point is that its contents
> are defined by the vendor driver to describe the device, driver version,
> and possibly metadata about the configuration of the device.  One
> instance of a device might generate a different string from another.
> The string that a device produces is not necessarily the only string
> the vendor driver will accept, for example the driver might support
> backwards compatible migrations.
>
> > > (2) backgrounds
> > >
> > > The reason we hope the migration_version string is opaque to the
> userspace
> > > is that it is hard to generalize standard comparing fields and
> comparing
> > > methods for different devices from different vendors.
> > > Though userspace now could still do a simple string compare to check =
if
> > > two devices are compatible, and result should also be right, it's sti=
ll
> > > too limited as it excludes the possible candidate whose
> migration_version
> > > string fails to be equal.
> > > e.g. an MDEV with mdev_type_1, aggregator count 3 is probably
> compatible
> > > with another MDEV with mdev_type_3, aggregator count 1, even their
> > > migration_version strings are not equal.
> > > (assumed mdev_type_3 is of 3 times equal resources of mdev_type_1).
> > >
> > > besides that, driver version + configured resources are all elements
> demanding
> > > to take into account.
> > >
> > > So, we hope leaving the freedom to vendor driver and let it make the
> final decision
> > > in a simple reading from source side and writing for test in the
> target side way.
> > >
> > >
> > > we then think the device compatibility issues for live migration with
> assigned
> > > devices can be divided into two steps:
> > > a. management tools filter out possible migration target devices.
> > >    Tags could be created according to info from product specification=
.
> > >    we think openstack/ovirt may have vendor proprietary components to
> create
> > >    those customized tags for each product from each vendor.
> >
> > >    for Intel vGPU, with a vGPU(a MDEV device) in source side, the tag=
s
> to
> > >    search target vGPU are like:
> > >    a tag for compatible parent PCI IDs,
> > >    a tag for a range of gvt driver versions,
> > >    a tag for a range of mdev type + aggregator count
> > >
> > >    for NVMe VF, the tags to search target VF may be like:
> > >    a tag for compatible PCI IDs,
> > >    a tag for a range of driver versions,
> > >    a tag for URL of configured remote storage.
>
> I interpret this as hand waving, ie. the first step is for management
> tools to make a good guess :-\  We don't seem to be willing to say that
> a given mdev type can only migrate to a device with that same type.
> There's this aggregation discussion happening separately where a base
> mdev type might be created or later configured to be equivalent to a
> different type.  The vfio migration API we've defined is also not
> limited to mdev devices, for example we could create vendor specific
> quirks or hooks to provide migration support for a physical PF/VF
> device.  Within the realm of possibility then is that we could migrate
> between a physical device and an mdev device, which are simply
> different degrees of creating a virtualization layer in front of the
> device.
>
> > Requiring management application developers to figure out this possible
> > compatibility based on prod specs is really unrealistic. Product specs
> > are typically as clear as mud, and with the suggestion we consider
> > different rules for different types of devices, add up to a huge amount
> > of complexity. This isn't something app developers should have to spend
> > their time figuring out.
>
> Agreed.
>
> > The suggestion that we make use of vendor proprietary helper components
> > is totally unacceptable. We need to be able to build a solution that
> > works with exclusively an open source software stack.
>
> I'm surprised to see this as well, but I'm not sure if Yan was really
> suggesting proprietary software so much as just vendor specific
> knowledge.
>
> > IMHO there needs to be a mechanism for the kernel to report via sysfs
> > what versions are supported on a given device. This puts the job of
> > reporting compatible versions directly under the responsibility of the
> > vendor who writes the kernel driver for it. They are the ones with the
> > best knowledge of the hardware they've built and the rules around its
> > compatibility.
>
> The version string discussed previously is the version string that
> represents a given device, possibly including driver information,
> configuration, etc.  I think what you're asking for here is an
> enumeration of every possible version string that a given device could
> accept as an incoming migration stream.  If we consider the string as
> opaque, that means the vendor driver needs to generate a separate
> string for every possible version it could accept, for every possible
> configuration option.  That potentially becomes an excessive amount of
> data to either generate or manage.


For the configuration options, there are two kinds of configuration options
are needn't for the migration check.

* The configuration option makes the device different, for example(could be
wrong example, not matching any real hardware),  A GPU supports 1024* 768
resolution and 800 * 600 resolution VGPUs, the OpenStack will separate this
two kinds of VGPUs into two separate resource pool. so the scheduler
already ensures we get a host with such vGPU support. so it needn't encode
into the 'version string' discussed here.
* The configuration option is setting before usage, just like the
'configured remote storage URL' above, it needn't encoded into the 'version
string' also. Since the openstack will configure the correct value before
the migration.


> Am I overestimating how vendors intend to use the version string?
>
> We'd also need to consider devices that we could create, for instance
> providing the same interface enumeration prior to creating an mdev
> device to have a confidence level that the new device would be a valid
> target.
>
> We defined the string as opaque to allow vendor flexibility and because
> defining a common format is hard.  Do we need to revisit this part of
> the discussion to define the version string as non-opaque with parsing
> rules, probably with separate incoming vs outgoing interfaces?  Thanks,
>
> Alex
>
>

--0000000000005e9f7d05aa75ce78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Alex Williamson &lt;<a href=3D"mailto=
:alex.williamson@redhat.com">alex.williamson@redhat.com</a>&gt; =E4=BA=8E20=
20=E5=B9=B47=E6=9C=8815=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=8812:16=
=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Tue, 14 Jul 2020 11:21:29 +0100<br>
Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com" target=
=3D"_blank">berrange@redhat.com</a>&gt; wrote:<br>
<br>
&gt; On Tue, Jul 14, 2020 at 07:29:57AM +0800, Yan Zhao wrote:<br>
&gt; &gt; hi folks,<br>
&gt; &gt; we are defining a device migration compatibility interface that h=
elps upper<br>
&gt; &gt; layer stack like openstack/ovirt/libvirt to check if two devices =
are<br>
&gt; &gt; live migration compatible.<br>
&gt; &gt; The &quot;devices&quot; here could be MDEVs, physical devices, or=
 hybrid of the two.<br>
&gt; &gt; e.g. we could use it to check whether<br>
&gt; &gt; - a src MDEV can migrate to a target MDEV,<br>
&gt; &gt; - a src VF in SRIOV can migrate to a target VF in SRIOV,<br>
&gt; &gt; - a src MDEV can migration to a target VF in SRIOV.<br>
&gt; &gt;=C2=A0 =C2=A0(e.g. SIOV/SRIOV backward compatibility case)<br>
&gt; &gt; <br>
&gt; &gt; The upper layer stack could use this interface as the last step t=
o check<br>
&gt; &gt; if one device is able to migrate to another device before trigger=
ing a real<br>
&gt; &gt; live migration procedure.<br>
&gt; &gt; we are not sure if this interface is of value or help to you. ple=
ase don&#39;t<br>
&gt; &gt; hesitate to drop your valuable comments.<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; (1) interface definition<br>
&gt; &gt; The interface is defined in below way:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __=C2=A0 =C2=A0 u=
serspace<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/\=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\write<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/ read=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt;=C2=A0 =C2=A0 ________/__________=C2=A0 =C2=A0 =C2=A0 =C2=A0___\|/=
_____________<br>
&gt; &gt;=C2=A0 =C2=A0| migration_version |=C2=A0 =C2=A0 =C2=A0| migration_=
version |--&gt;check migration<br>
&gt; &gt;=C2=A0 =C2=A0---------------------=C2=A0 =C2=A0 =C2=A0------------=
---------=C2=A0 =C2=A0compatibility<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 device A=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 device B<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; a device attribute named migration_version is defined under each =
device&#39;s<br>
&gt; &gt; sysfs node. e.g. (/sys/bus/pci/devices/0000\:00\:02.0/$mdev_UUID/=
migration_version).<br>
&gt; &gt; userspace tools read the migration_version as a string from the s=
ource device,<br>
&gt; &gt; and write it to the migration_version sysfs attribute in the targ=
et device.<br>
&gt; &gt; <br>
&gt; &gt; The userspace should treat ANY of below conditions as two devices=
 not compatible:<br>
&gt; &gt; - any one of the two devices does not have a migration_version at=
tribute<br>
&gt; &gt; - error when reading from migration_version attribute of one devi=
ce<br>
&gt; &gt; - error when writing migration_version string of one device to<br=
>
&gt; &gt;=C2=A0 =C2=A0migration_version attribute of the other device<br>
&gt; &gt; <br>
&gt; &gt; The string read from migration_version attribute is defined by de=
vice vendor<br>
&gt; &gt; driver and is completely opaque to the userspace.<br>
&gt; &gt; for a Intel vGPU, string format can be defined like<br>
&gt; &gt; &quot;parent device PCI ID&quot; + &quot;version of gvt driver&qu=
ot; + &quot;mdev type&quot; + &quot;aggregator count&quot;.</blockquote><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
&gt; &gt; <br>
&gt; &gt; for an NVMe VF connecting to a remote storage. it could be<br>
&gt; &gt; &quot;PCI ID&quot; + &quot;driver version&quot; + &quot;configure=
d remote storage URL&quot;<br></blockquote><div><br></div><div>If the &quot=
;configured remote storage URL&quot; is something configuration=C2=A0settin=
g before the usage, then it isn&#39;t something we need for migration compa=
tible check. Openstack only needs to know the target device&#39;s driver an=
d hardware compatible for migration, then the scheduler will choose a host =
which such device, and then Openstack will pre-configure the target host an=
d target device before the migration, then openstack will configure the cor=
rect remote storage URL to the device. If we want, we can do a sanity check=
 after the live migration with the os.</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
&gt; &gt; <br>
&gt; &gt; for a QAT VF, it may be<br>
&gt; &gt; &quot;PCI ID&quot; + &quot;driver version&quot; + &quot;supported=
 encryption set&quot;.<br>
&gt; &gt; <br>
&gt; &gt; (to avoid namespace confliction from each vendor, we may prefix a=
 driver name to<br>
&gt; &gt; each migration_version string. e.g. i915-v1-8086-591d-i915-GVTg_V=
5_8-1)<br>
<br>
It&#39;s very strange to define it as opaque and then proceed to describe<b=
r>
the contents of that opaque string.=C2=A0 The point is that its contents<br=
>
are defined by the vendor driver to describe the device, driver version,<br=
>
and possibly metadata about the configuration of the device.=C2=A0 One<br>
instance of a device might generate a different string from another.<br>
The string that a device produces is not necessarily the only string<br>
the vendor driver will accept, for example the driver might support<br>
backwards compatible migrations.<br>
<br>
&gt; &gt; (2) backgrounds<br>
&gt; &gt; <br>
&gt; &gt; The reason we hope the migration_version string is opaque to the =
userspace<br>
&gt; &gt; is that it is hard to generalize standard comparing fields and co=
mparing<br>
&gt; &gt; methods for different devices from different vendors.<br>
&gt; &gt; Though userspace now could still do a simple string compare to ch=
eck if<br>
&gt; &gt; two devices are compatible, and result should also be right, it&#=
39;s still<br>
&gt; &gt; too limited as it excludes the possible candidate whose migration=
_version<br>
&gt; &gt; string fails to be equal.<br>
&gt; &gt; e.g. an MDEV with mdev_type_1, aggregator count 3 is probably com=
patible<br>
&gt; &gt; with another MDEV with mdev_type_3, aggregator count 1, even thei=
r<br>
&gt; &gt; migration_version strings are not equal.<br>
&gt; &gt; (assumed mdev_type_3 is of 3 times equal resources of mdev_type_1=
).<br>
&gt; &gt; <br>
&gt; &gt; besides that, driver version + configured resources are all eleme=
nts demanding<br>
&gt; &gt; to take into account.<br>
&gt; &gt; <br>
&gt; &gt; So, we hope leaving the freedom to vendor driver and let it make =
the final decision<br>
&gt; &gt; in a simple reading from source side and writing for test in the =
target side way.<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; we then think the device compatibility issues for live migration =
with assigned<br>
&gt; &gt; devices can be divided into two steps:<br>
&gt; &gt; a. management tools filter out possible migration target devices.=
<br>
&gt; &gt;=C2=A0 =C2=A0 Tags could be created according to info from product=
 specification.<br>
&gt; &gt;=C2=A0 =C2=A0 we think openstack/ovirt may have vendor proprietary=
 components to create<br>
&gt; &gt;=C2=A0 =C2=A0 those customized tags for each product from each ven=
dor.=C2=A0 <br>
&gt; <br>
&gt; &gt;=C2=A0 =C2=A0 for Intel vGPU, with a vGPU(a MDEV device) in source=
 side, the tags to<br>
&gt; &gt;=C2=A0 =C2=A0 search target vGPU are like:<br>
&gt; &gt;=C2=A0 =C2=A0 a tag for compatible parent PCI IDs,<br>
&gt; &gt;=C2=A0 =C2=A0 a tag for a range of gvt driver versions,<br>
&gt; &gt;=C2=A0 =C2=A0 a tag for a range of mdev type + aggregator count<br=
>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 for NVMe VF, the tags to search target VF may be lik=
e:<br>
&gt; &gt;=C2=A0 =C2=A0 a tag for compatible PCI IDs,<br>
&gt; &gt;=C2=A0 =C2=A0 a tag for a range of driver versions,<br>
&gt; &gt;=C2=A0 =C2=A0 a tag for URL of configured remote storage.=C2=A0 <b=
r>
<br>
I interpret this as hand waving, ie. the first step is for management<br>
tools to make a good guess :-\=C2=A0 We don&#39;t seem to be willing to say=
 that<br>
a given mdev type can only migrate to a device with that same type.<br>
There&#39;s this aggregation discussion happening separately where a base<b=
r>
mdev type might be created or later configured to be equivalent to a<br>
different type.=C2=A0 The vfio migration API we&#39;ve defined is also not<=
br>
limited to mdev devices, for example we could create vendor specific<br>
quirks or hooks to provide migration support for a physical PF/VF<br>
device.=C2=A0 Within the realm of possibility then is that we could migrate=
<br>
between a physical device and an mdev device, which are simply<br>
different degrees of creating a virtualization layer in front of the<br>
device.<br>
<br>
&gt; Requiring management application developers to figure out this possibl=
e<br>
&gt; compatibility based on prod specs is really unrealistic. Product specs=
<br>
&gt; are typically as clear as mud, and with the suggestion we consider<br>
&gt; different rules for different types of devices, add up to a huge amoun=
t<br>
&gt; of complexity. This isn&#39;t something app developers should have to =
spend<br>
&gt; their time figuring out.<br>
<br>
Agreed.<br>
<br>
&gt; The suggestion that we make use of vendor proprietary helper component=
s<br>
&gt; is totally unacceptable. We need to be able to build a solution that<b=
r>
&gt; works with exclusively an open source software stack.<br>
<br>
I&#39;m surprised to see this as well, but I&#39;m not sure if Yan was real=
ly<br>
suggesting proprietary software so much as just vendor specific<br>
knowledge.<br>
<br>
&gt; IMHO there needs to be a mechanism for the kernel to report via sysfs<=
br>
&gt; what versions are supported on a given device. This puts the job of<br=
>
&gt; reporting compatible versions directly under the responsibility of the=
<br>
&gt; vendor who writes the kernel driver for it. They are the ones with the=
<br>
&gt; best knowledge of the hardware they&#39;ve built and the rules around =
its<br>
&gt; compatibility.<br>
<br>
The version string discussed previously is the version string that<br>
represents a given device, possibly including driver information,<br>
configuration, etc.=C2=A0 I think what you&#39;re asking for here is an<br>
enumeration of every possible version string that a given device could<br>
accept as an incoming migration stream.=C2=A0 If we consider the string as<=
br>
opaque, that means the vendor driver needs to generate a separate<br>
string for every possible version it could accept, for every possible<br>
configuration option.=C2=A0 That potentially becomes an excessive amount of=
<br>
data to either generate or manage.=C2=A0</blockquote><div><br></div><div>Fo=
r the configuration options, there are two kinds of configuration options a=
re needn&#39;t for the migration check.</div><div><br></div><div>* The conf=
iguration option makes the device different, for example(could be wrong exa=
mple, not matching any real hardware),=C2=A0 A GPU supports 1024* 768 resol=
ution and 800 * 600 resolution VGPUs, the OpenStack will separate this two =
kinds of VGPUs into two separate resource pool. so the scheduler already en=
sures we get a host with such vGPU support. so it needn&#39;t=C2=A0encode i=
nto the &#39;version string&#39; discussed here.</div><div>* The configurat=
ion option is setting before usage, just like the &#39;configured remote st=
orage URL&#39; above, it needn&#39;t encoded into the &#39;version string&#=
39; also. Since the openstack will configure the correct value before the m=
igration.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
Am I overestimating how vendors intend to use the version string?<br>
<br>
We&#39;d also need to consider devices that we could create, for instance<b=
r>
providing the same interface enumeration prior to creating an mdev<br>
device to have a confidence level that the new device would be a valid<br>
target.<br>
<br>
We defined the string as opaque to allow vendor flexibility and because<br>
defining a common format is hard.=C2=A0 Do we need to revisit this part of<=
br>
the discussion to define the version string as non-opaque with parsing<br>
rules, probably with separate incoming vs outgoing interfaces?=C2=A0 Thanks=
,<br>
<br>
Alex<br>
<br>
</blockquote></div></div>

--0000000000005e9f7d05aa75ce78--

--===============0004512583==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============0004512583==--
