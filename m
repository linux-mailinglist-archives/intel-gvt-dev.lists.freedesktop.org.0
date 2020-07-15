Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8199B22088A
	for <lists+intel-gvt-dev@lfdr.de>; Wed, 15 Jul 2020 11:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A3B6EA73;
	Wed, 15 Jul 2020 09:21:23 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE366EA70
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Jul 2020 09:21:22 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id q3so1359544ilt.8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 15 Jul 2020 02:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5+2s9vpdlfqPxA6d/DSu9gNG3Wd0tiPq4gUjiKeINjI=;
 b=SehgSaKMaGErG6augRgsZOHCnTbmDTuPbDbaP5HQloBdaseI/vjd2PJAbytLi09nCN
 t6WUmrKKVddCMz1fwNeuC03SyNFvwkQjIw1PaePgp3tMRmUoxpWYEyADZHCHR1Xy7ZsA
 Ea+hVQh0sDSuMoz2337nf07glTC80qfbhVPLfJqsvsMSraAw7YPiqTmHBK+JBnYpWX+f
 BnTMWJc8vBx8Aci9V9voYn9ECKbmjlE8mPUoGEDtaeRK18Xx3/rAIWRxYb8QltoI7NyN
 SwNeHsXQRIUkmr0/42BNy86BkHxEwdH/9TuOInZdm46PGV6uDzO63KHzfZRKUqwdWWxp
 X9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5+2s9vpdlfqPxA6d/DSu9gNG3Wd0tiPq4gUjiKeINjI=;
 b=bjeqMgp6jDYGf2pHaXL0x0OAmoi8zEaEoZ8vBGAQCtTAC1Wf5lZAOg9KtI2UuWLLCk
 AazVDNxJ1Cxv/N1v2dBy2gRt//L8ULZ0Sd3dHJMhXB++5vqBd/IJI/JbwKGSOWD4qhJ5
 5aA/rSnRTSyiPcpE9VUDM0pyLKgfToYd54hY+p0lLEqzOR2rHFg35ruMBLI9M3RrLVjH
 uoRCbe7/6Qt1MuzoU8hx/FbRXjjdEVwii7QWOjsscDyZGo9FZG2Qyu1y05e45eCxfcvN
 kU8pczH7Xh2+hgS8K+7oqTAWFfWgkgFd+ffskq5W16HFvWN+ikHdeFnXYJ8f+ut5S+vA
 2MXA==
X-Gm-Message-State: AOAM532oFRE/3v60p0j18p7hpfMbOVWAxhxku7maOlKgVbqso1w4Pij6
 wAYFUdO4LZ+wPl5+NSaKj+QhrwsPRDD9S3fjqJY=
X-Google-Smtp-Source: ABdhPJxytDQtqNSU365ru5OFp6bL7U2YcxnGFu+clsAIgPqn12doIVIp3sTjHYVng6+oQJa9/CT7U8E6RJbEVXe0D0s=
X-Received: by 2002:a92:5ecf:: with SMTP id f76mr9466043ilg.6.1594804881747;
 Wed, 15 Jul 2020 02:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200713232957.GD5955@joy-OptiPlex-7040>
 <20200714102129.GD25187@redhat.com>
 <20200714101616.5d3a9e75@x1.home> <20200714171946.GL2728@work-vm>
 <20200714145948.17b95eb3@x1.home> <20200715082040.GA13136@joy-OptiPlex-7040>
In-Reply-To: <20200715082040.GA13136@joy-OptiPlex-7040>
From: Alex Xu <soulxu@gmail.com>
Date: Wed, 15 Jul 2020 17:21:09 +0800
Message-ID: <CAH7mGavrE2xhm9HpNHSFsPzZZQNTH+BJFWbh4kBxhhDe2ddHdg@mail.gmail.com>
Subject: Re: device compatibility interface for live migration with assigned
 devices
To: Yan Zhao <yan.y.zhao@intel.com>
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
 Xin-ran" <xin-ran.wang@intel.com>, corbet@lwn.net, devel@ovirt.org,
 openstack-discuss <openstack-discuss@lists.openstack.org>,
 shaohe.feng@intel.com, kevin.tian@intel.com, eskultet@redhat.com, "Ding,
 Jian-feng" <jian-feng.ding@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, zhenyuw@linux.intel.com, "Xu,
 Hejie" <hejie.xu@intel.com>, bao.yumeng@zte.com.cn,
 Alex Williamson <alex.williamson@redhat.com>, Sean Mooney <smooney@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, cohuck@redhat.com, dinechin@redhat.com
Content-Type: multipart/mixed; boundary="===============2057113214=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

--===============2057113214==
Content-Type: multipart/alternative; boundary="00000000000076761305aa7772bc"

--00000000000076761305aa7772bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yan Zhao <yan.y.zhao@intel.com> =E4=BA=8E2020=E5=B9=B47=E6=9C=8815=E6=97=A5=
=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=884:32=E5=86=99=E9=81=93=EF=BC=9A

> On Tue, Jul 14, 2020 at 02:59:48PM -0600, Alex Williamson wrote:
> > On Tue, 14 Jul 2020 18:19:46 +0100
> > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> >
> > > * Alex Williamson (alex.williamson@redhat.com) wrote:
> > > > On Tue, 14 Jul 2020 11:21:29 +0100
> > > > Daniel P. Berrang=C3=83=C2=A9 <berrange@redhat.com> wrote:
> > > >
> > > > > On Tue, Jul 14, 2020 at 07:29:57AM +0800, Yan Zhao wrote:
> > > > > > hi folks,
> > > > > > we are defining a device migration compatibility interface that
> helps upper
> > > > > > layer stack like openstack/ovirt/libvirt to check if two device=
s
> are
> > > > > > live migration compatible.
> > > > > > The "devices" here could be MDEVs, physical devices, or hybrid
> of the two.
> > > > > > e.g. we could use it to check whether
> > > > > > - a src MDEV can migrate to a target MDEV,
> > > > > > - a src VF in SRIOV can migrate to a target VF in SRIOV,
> > > > > > - a src MDEV can migration to a target VF in SRIOV.
> > > > > >   (e.g. SIOV/SRIOV backward compatibility case)
> > > > > >
> > > > > > The upper layer stack could use this interface as the last step
> to check
> > > > > > if one device is able to migrate to another device before
> triggering a real
> > > > > > live migration procedure.
> > > > > > we are not sure if this interface is of value or help to you.
> please don't
> > > > > > hesitate to drop your valuable comments.
> > > > > >
> > > > > >
> > > > > > (1) interface definition
> > > > > > The interface is defined in below way:
> > > > > >
> > > > > >              __    userspace
> > > > > >               /\              \
> > > > > >              /                 \write
> > > > > >             / read              \
> > > > > >    ________/__________       ___\|/_____________
> > > > > >   | migration_version |     | migration_version |-->check
> migration
> > > > > >   ---------------------     ---------------------   compatibili=
ty
> > > > > >      device A                    device B
> > > > > >
> > > > > >
> > > > > > a device attribute named migration_version is defined under eac=
h
> device's
> > > > > > sysfs node. e.g.
> (/sys/bus/pci/devices/0000\:00\:02.0/$mdev_UUID/migration_version).
> > > > > > userspace tools read the migration_version as a string from the
> source device,
> > > > > > and write it to the migration_version sysfs attribute in the
> target device.
> > > > > >
> > > > > > The userspace should treat ANY of below conditions as two
> devices not compatible:
> > > > > > - any one of the two devices does not have a migration_version
> attribute
> > > > > > - error when reading from migration_version attribute of one
> device
> > > > > > - error when writing migration_version string of one device to
> > > > > >   migration_version attribute of the other device
> > > > > >
> > > > > > The string read from migration_version attribute is defined by
> device vendor
> > > > > > driver and is completely opaque to the userspace.
> > > > > > for a Intel vGPU, string format can be defined like
> > > > > > "parent device PCI ID" + "version of gvt driver" + "mdev type" =
+
> "aggregator count".
> > > > > >
> > > > > > for an NVMe VF connecting to a remote storage. it could be
> > > > > > "PCI ID" + "driver version" + "configured remote storage URL"
> > > > > >
> > > > > > for a QAT VF, it may be
> > > > > > "PCI ID" + "driver version" + "supported encryption set".
> > > > > >
> > > > > > (to avoid namespace confliction from each vendor, we may prefix
> a driver name to
> > > > > > each migration_version string. e.g.
> i915-v1-8086-591d-i915-GVTg_V5_8-1)
> > > >
> > > > It's very strange to define it as opaque and then proceed to descri=
be
> > > > the contents of that opaque string.  The point is that its contents
> > > > are defined by the vendor driver to describe the device, driver
> version,
> > > > and possibly metadata about the configuration of the device.  One
> > > > instance of a device might generate a different string from another=
.
> > > > The string that a device produces is not necessarily the only strin=
g
> > > > the vendor driver will accept, for example the driver might support
> > > > backwards compatible migrations.
> > >
> > > (As I've said in the previous discussion, off one of the patch series=
)
> > >
> > > My view is it makes sense to have a half-way house on the opaqueness =
of
> > > this string; I'd expect to have an ID and version that are human
> > > readable, maybe a device ID/name that's human interpretable and then =
a
> > > bunch of other cruft that maybe device/vendor/version specific.
> > >
> > > I'm thinking that we want to be able to report problems and include t=
he
> > > string and the user to be able to easily identify the device that was
> > > complaining and notice a difference in versions, and perhaps also use
> > > it in compatibility patterns to find compatible hosts; but that does
> > > get tricky when it's a 'ask the device if it's compatible'.
> >
> > In the reply I just sent to Dan, I gave this example of what a
> > "compatibility string" might look like represented as json:
> >
> > {
> >   "device_api": "vfio-pci",
> >   "vendor": "vendor-driver-name",
> >   "version": {
> >     "major": 0,
> >     "minor": 1
> >   },
> >   "vfio-pci": { // Based on above device_api
> >     "vendor": 0x1234, // Values for the exposed device
> >     "device": 0x5678,
> >       // Possibly further parameters for a more specific match
> >   },
> >   "mdev_attrs": [
> >     { "attribute0": "VALUE" }
> >   ]
> > }
> >
> > Are you thinking that we might allow the vendor to include a vendor
> > specific array where we'd simply require that both sides have matching
> > fields and values?  ie.
> >
> >   "vendor_fields": [
> >     { "unknown_field0": "unknown_value0" },
> >     { "unknown_field1": "unknown_value1" },
> >   ]
> >
> > We could certainly make that part of the spec, but I can't really
> > figure the value of it other than to severely restrict compatibility,
> > which the vendor could already do via the version.major value.  Maybe
> > they'd want to put a build timestamp, random uuid, or source sha1 into
> > such a field to make absolutely certain compatibility is only determine=
d
> > between identical builds?  Thanks,
> >
> Yes, I agree kernel could expose such sysfs interface to educate
> openstack how to filter out devices. But I still think the proposed
> migration_version (or rename to migration_compatibility) interface is
> still required for libvirt to do double check.
>
> In the following scenario:
> 1. openstack chooses the target device by reading sysfs interface (of jso=
n
> format) of the source device. And Openstack are now pretty sure the two
> devices are migration compatible.
> 2. openstack asks libvirt to create the target VM with the target device
> and start live migration.
> 3. libvirt now receives the request. so it now has two choices:
> (1) create the target VM & target device and start live migration directl=
y
> (2) double check if the target device is compatible with the source
> device before doing the remaining tasks.
>
> Because the factors to determine whether two devices are live migration
> compatible are complicated and may be dynamically changing, (e.g. driver
> upgrade or configuration changes), and also because libvirt should not
> totally rely on the input from openstack, I think the cost for libvirt is
> relatively lower if it chooses to go (2) than (1). At least it has no
> need to cancel migration and destroy the VM if it knows it earlier.
>

If the driver upgrade or configuration changes, I guess there should be a
restart of openstack agent on the host, that will update the info to the
scheduler.
so it should be fine.

For (2), probably it need be used for double check when the orchestration
layer doesn't implement the check logic in the scheduler.


>
> So, it means the kernel may need to expose two parallel interfaces:
> (1) with json format, enumerating all possible fields and comparing
> methods, so as to indicate openstack how to find a matching target device
> (2) an opaque driver defined string, requiring write and test in target,
> which is used by libvirt to make sure device compatibility, rather than
> rely on the input accurateness from openstack or rely on kernel driver
> implementing the compatibility detection immediately after migration
> start.
>
> Does it make sense?
>
> Thanks
> Yan
>
>
>
>
>
>
>
>
>

--00000000000076761305aa7772bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Yan Zhao &lt;<a href=3D"mailto:yan.y.=
zhao@intel.com">yan.y.zhao@intel.com</a>&gt; =E4=BA=8E2020=E5=B9=B47=E6=9C=
=8815=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=884:32=E5=86=99=E9=81=93=
=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue=
, Jul 14, 2020 at 02:59:48PM -0600, Alex Williamson wrote:<br>
&gt; On Tue, 14 Jul 2020 18:19:46 +0100<br>
&gt; &quot;Dr. David Alan Gilbert&quot; &lt;<a href=3D"mailto:dgilbert@redh=
at.com" target=3D"_blank">dgilbert@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; * Alex Williamson (<a href=3D"mailto:alex.williamson@redhat.com" =
target=3D"_blank">alex.williamson@redhat.com</a>) wrote:<br>
&gt; &gt; &gt; On Tue, 14 Jul 2020 11:21:29 +0100<br>
&gt; &gt; &gt; Daniel P. Berrang=C3=83=C2=A9 &lt;<a href=3D"mailto:berrange=
@redhat.com" target=3D"_blank">berrange@redhat.com</a>&gt; wrote:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0<br>
&gt; &gt; &gt; &gt; On Tue, Jul 14, 2020 at 07:29:57AM +0800, Yan Zhao wrot=
e:=C2=A0 <br>
&gt; &gt; &gt; &gt; &gt; hi folks,<br>
&gt; &gt; &gt; &gt; &gt; we are defining a device migration compatibility i=
nterface that helps upper<br>
&gt; &gt; &gt; &gt; &gt; layer stack like openstack/ovirt/libvirt to check =
if two devices are<br>
&gt; &gt; &gt; &gt; &gt; live migration compatible.<br>
&gt; &gt; &gt; &gt; &gt; The &quot;devices&quot; here could be MDEVs, physi=
cal devices, or hybrid of the two.<br>
&gt; &gt; &gt; &gt; &gt; e.g. we could use it to check whether<br>
&gt; &gt; &gt; &gt; &gt; - a src MDEV can migrate to a target MDEV,<br>
&gt; &gt; &gt; &gt; &gt; - a src VF in SRIOV can migrate to a target VF in =
SRIOV,<br>
&gt; &gt; &gt; &gt; &gt; - a src MDEV can migration to a target VF in SRIOV=
.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0(e.g. SIOV/SRIOV backward compatibilit=
y case)<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; The upper layer stack could use this interface as =
the last step to check<br>
&gt; &gt; &gt; &gt; &gt; if one device is able to migrate to another device=
 before triggering a real<br>
&gt; &gt; &gt; &gt; &gt; live migration procedure.<br>
&gt; &gt; &gt; &gt; &gt; we are not sure if this interface is of value or h=
elp to you. please don&#39;t<br>
&gt; &gt; &gt; &gt; &gt; hesitate to drop your valuable comments.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; (1) interface definition<br>
&gt; &gt; &gt; &gt; &gt; The interface is defined in below way:<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __=
=C2=A0 =C2=A0 userspace<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/\=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\write<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/ r=
ead=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 ________/__________=C2=A0 =C2=A0 =C2=
=A0 =C2=A0___\|/_____________<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0| migration_version |=C2=A0 =C2=A0 =C2=
=A0| migration_version |--&gt;check migration<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0---------------------=C2=A0 =C2=A0 =C2=
=A0---------------------=C2=A0 =C2=A0compatibility<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 device A=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 device B<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; a device attribute named migration_version is defi=
ned under each device&#39;s<br>
&gt; &gt; &gt; &gt; &gt; sysfs node. e.g. (/sys/bus/pci/devices/0000\:00\:0=
2.0/$mdev_UUID/migration_version).<br>
&gt; &gt; &gt; &gt; &gt; userspace tools read the migration_version as a st=
ring from the source device,<br>
&gt; &gt; &gt; &gt; &gt; and write it to the migration_version sysfs attrib=
ute in the target device.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; The userspace should treat ANY of below conditions=
 as two devices not compatible:<br>
&gt; &gt; &gt; &gt; &gt; - any one of the two devices does not have a migra=
tion_version attribute<br>
&gt; &gt; &gt; &gt; &gt; - error when reading from migration_version attrib=
ute of one device<br>
&gt; &gt; &gt; &gt; &gt; - error when writing migration_version string of o=
ne device to<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0migration_version attribute of the oth=
er device<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; The string read from migration_version attribute i=
s defined by device vendor<br>
&gt; &gt; &gt; &gt; &gt; driver and is completely opaque to the userspace.<=
br>
&gt; &gt; &gt; &gt; &gt; for a Intel vGPU, string format can be defined lik=
e<br>
&gt; &gt; &gt; &gt; &gt; &quot;parent device PCI ID&quot; + &quot;version o=
f gvt driver&quot; + &quot;mdev type&quot; + &quot;aggregator count&quot;.<=
br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; for an NVMe VF connecting to a remote storage. it =
could be<br>
&gt; &gt; &gt; &gt; &gt; &quot;PCI ID&quot; + &quot;driver version&quot; + =
&quot;configured remote storage URL&quot;<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; for a QAT VF, it may be<br>
&gt; &gt; &gt; &gt; &gt; &quot;PCI ID&quot; + &quot;driver version&quot; + =
&quot;supported encryption set&quot;.<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; (to avoid namespace confliction from each vendor, =
we may prefix a driver name to<br>
&gt; &gt; &gt; &gt; &gt; each migration_version string. e.g. i915-v1-8086-5=
91d-i915-GVTg_V5_8-1)=C2=A0 <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; It&#39;s very strange to define it as opaque and then procee=
d to describe<br>
&gt; &gt; &gt; the contents of that opaque string.=C2=A0 The point is that =
its contents<br>
&gt; &gt; &gt; are defined by the vendor driver to describe the device, dri=
ver version,<br>
&gt; &gt; &gt; and possibly metadata about the configuration of the device.=
=C2=A0 One<br>
&gt; &gt; &gt; instance of a device might generate a different string from =
another.<br>
&gt; &gt; &gt; The string that a device produces is not necessarily the onl=
y string<br>
&gt; &gt; &gt; the vendor driver will accept, for example the driver might =
support<br>
&gt; &gt; &gt; backwards compatible migrations.=C2=A0 <br>
&gt; &gt; <br>
&gt; &gt; (As I&#39;ve said in the previous discussion, off one of the patc=
h series)<br>
&gt; &gt; <br>
&gt; &gt; My view is it makes sense to have a half-way house on the opaquen=
ess of<br>
&gt; &gt; this string; I&#39;d expect to have an ID and version that are hu=
man<br>
&gt; &gt; readable, maybe a device ID/name that&#39;s human interpretable a=
nd then a<br>
&gt; &gt; bunch of other cruft that maybe device/vendor/version specific.<b=
r>
&gt; &gt; <br>
&gt; &gt; I&#39;m thinking that we want to be able to report problems and i=
nclude the<br>
&gt; &gt; string and the user to be able to easily identify the device that=
 was<br>
&gt; &gt; complaining and notice a difference in versions, and perhaps also=
 use<br>
&gt; &gt; it in compatibility patterns to find compatible hosts; but that d=
oes<br>
&gt; &gt; get tricky when it&#39;s a &#39;ask the device if it&#39;s compat=
ible&#39;.<br>
&gt; <br>
&gt; In the reply I just sent to Dan, I gave this example of what a<br>
&gt; &quot;compatibility string&quot; might look like represented as json:<=
br>
&gt; <br>
&gt; {<br>
&gt;=C2=A0 =C2=A0&quot;device_api&quot;: &quot;vfio-pci&quot;,<br>
&gt;=C2=A0 =C2=A0&quot;vendor&quot;: &quot;vendor-driver-name&quot;,<br>
&gt;=C2=A0 =C2=A0&quot;version&quot;: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;major&quot;: 0,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;minor&quot;: 1<br>
&gt;=C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0&quot;vfio-pci&quot;: { // Based on above device_api<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;vendor&quot;: 0x1234, // Values for the expos=
ed device<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;device&quot;: 0x5678,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0// Possibly further parameters for a more sp=
ecific match<br>
&gt;=C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0&quot;mdev_attrs&quot;: [<br>
&gt;=C2=A0 =C2=A0 =C2=A0{ &quot;attribute0&quot;: &quot;VALUE&quot; }<br>
&gt;=C2=A0 =C2=A0]<br>
&gt; }<br>
&gt; <br>
&gt; Are you thinking that we might allow the vendor to include a vendor<br=
>
&gt; specific array where we&#39;d simply require that both sides have matc=
hing<br>
&gt; fields and values?=C2=A0 ie.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0&quot;vendor_fields&quot;: [<br>
&gt;=C2=A0 =C2=A0 =C2=A0{ &quot;unknown_field0&quot;: &quot;unknown_value0&=
quot; },<br>
&gt;=C2=A0 =C2=A0 =C2=A0{ &quot;unknown_field1&quot;: &quot;unknown_value1&=
quot; },<br>
&gt;=C2=A0 =C2=A0]<br>
&gt; <br>
&gt; We could certainly make that part of the spec, but I can&#39;t really<=
br>
&gt; figure the value of it other than to severely restrict compatibility,<=
br>
&gt; which the vendor could already do via the version.major value.=C2=A0 M=
aybe<br>
&gt; they&#39;d want to put a build timestamp, random uuid, or source sha1 =
into<br>
&gt; such a field to make absolutely certain compatibility is only determin=
ed<br>
&gt; between identical builds?=C2=A0 Thanks,<br>
&gt;<br>
Yes, I agree kernel could expose such sysfs interface to educate<br>
openstack how to filter out devices. But I still think the proposed<br>
migration_version (or rename to migration_compatibility) interface is<br>
still required for libvirt to do double check.<br>
<br>
In the following scenario: <br>
1. openstack chooses the target device by reading sysfs interface (of json<=
br>
format) of the source device. And Openstack are now pretty sure the two<br>
devices are migration compatible.<br>
2. openstack asks libvirt to create the target VM with the target device<br=
>
and start live migration.<br>
3. libvirt now receives the request. so it now has two choices:<br>
(1) create the target VM &amp; target device and start live migration direc=
tly<br>
(2) double check if the target device is compatible with the source<br>
device before doing the remaining tasks.<br>
<br>
Because the factors to determine whether two devices are live migration<br>
compatible are complicated and may be dynamically changing, (e.g. driver<br=
>
upgrade or configuration changes), and also because libvirt should not<br>
totally rely on the input from openstack, I think the cost for libvirt is<b=
r>
relatively lower if it chooses to go (2) than (1). At least it has no<br>
need to cancel migration and destroy the VM if it knows it earlier.<br></bl=
ockquote><div><br></div><div>If the driver upgrade or configuration changes=
, I guess there should be a restart of openstack agent on the host, that wi=
ll update the info to the scheduler.</div><div>so it should be fine.</div><=
div><br></div><div>For (2), probably it need be used for double check when =
the orchestration layer doesn&#39;t implement the check logic in the schedu=
ler.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
So, it means the kernel may need to expose two parallel interfaces:<br>
(1) with json format, enumerating all possible fields and comparing<br>
methods, so as to indicate openstack how to find a matching target device<b=
r>
(2) an opaque driver defined string, requiring write and test in target,<br=
>
which is used by libvirt to make sure device compatibility, rather than<br>
rely on the input accurateness from openstack or rely on kernel driver<br>
implementing the compatibility detection immediately after migration<br>
start.<br>
<br>
Does it make sense?<br>
<br>
Thanks<br>
Yan<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000076761305aa7772bc--

--===============2057113214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
intel-gvt-dev mailing list
intel-gvt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--===============2057113214==--
