Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F34FD67420E
	for <lists+intel-gvt-dev@lfdr.de>; Thu, 19 Jan 2023 20:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76DF810E9D0;
	Thu, 19 Jan 2023 19:05:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD7B10E9C8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 19 Jan 2023 19:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674155119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xI3gAlOvH6+nGCjjMQeJA8j8339HePE6Q0SOl9Tovc0=;
 b=C/FtD8BqnPUY7adbDRud+ySFekNSCc+0+lilsx1+6ezCUP2Y4+Z2hPdafCyG191XccyfmD
 9uUSCnPgK/L6wUYSzuXAV2aiomyhKnSYa16KNxv0huT1dI0cahHhlMoFaegTqD4FVMeOB/
 kgJKmFNmUESOCmAup2ExjZLO4cg1Ofg=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-343-c8QOcQEcPHirmdx6yosjyQ-1; Thu, 19 Jan 2023 14:05:17 -0500
X-MC-Unique: c8QOcQEcPHirmdx6yosjyQ-1
Received: by mail-io1-f69.google.com with SMTP id
 b21-20020a5d8d95000000b006fa39fbb94eso1621230ioj.17
 for <intel-gvt-dev@lists.freedesktop.org>;
 Thu, 19 Jan 2023 11:05:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qxwOPOgGhsGm2CilOB8QktAtozAzPUo8tE7EUr+QkN4=;
 b=45tRB6mUBV0UeX4L35iqLKqJ3p+fhN/f90fKcDSPgEbUr7MatDQUghGwbx/bjAWvRh
 uNtMsHo4/HdpLfbj1REU5qVRzLYh/c1Bx22/CtZhLMjDLG39G7IFzM24O/e0ZrKXqmZu
 7aNA/sb+rbY3f+HW/d+C7gzUNjrBwNNMLsSivH0bFUAOsURgDuYLCjOO++olhdOCVdZ1
 qPkBx06/JKLwdgVKlm2uScG8DUfo40k604iw4WcSISf7jFD7E5h7LYBtyDeKVf3y4nu4
 CKEAGLpWPU2HdPFC0ditWUARNvthONDtif2rzvjzcqFHGRxHms1usHUnDq3N6qK/BP+e
 RbAg==
X-Gm-Message-State: AFqh2kpCY+QGNFpVq2HWFN1NRDwIg2KthIV4yY9Hcw+QG3adJZIJMp/o
 nVne60OeUnCMHZ/0BoZaEI89nyrOnYqICQCDQoc22mE6dqXnfV2bBCzuMScJIpjDgpzYS5pJB3B
 MV5nKo7fhQyY9KXU1PxhvX/GVE+oPKR2YyA==
X-Received: by 2002:a6b:dc12:0:b0:707:5b8d:745 with SMTP id
 s18-20020a6bdc12000000b007075b8d0745mr5702699ioc.15.1674155116321; 
 Thu, 19 Jan 2023 11:05:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtAMnL3Goqn5o+Ir8AcCe1SjWgVNFXCOrdiM/sijKRrcXt8wW9+Bm8x+wiDCw846gf100RgOg==
X-Received: by 2002:a6b:dc12:0:b0:707:5b8d:745 with SMTP id
 s18-20020a6bdc12000000b007075b8d0745mr5702666ioc.15.1674155116049; 
 Thu, 19 Jan 2023 11:05:16 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 m4-20020a056638224400b0036c8a246f54sm11646670jas.142.2023.01.19.11.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 11:05:15 -0800 (PST)
Date: Thu, 19 Jan 2023 12:05:13 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v4] vfio: fix potential deadlock on vfio group lock
Message-ID: <20230119120513.3976cda7.alex.williamson@redhat.com>
In-Reply-To: <BN9PR11MB5276CC29F17B87D14D1E61FF8CC49@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20230114000351.115444-1-mjrosato@linux.ibm.com>
 <20230117142252.70cc85c7.alex.williamson@redhat.com>
 <BN9PR11MB52763D861C254248FD33F65C8CC79@BN9PR11MB5276.namprd11.prod.outlook.com>
 <b5a7efc9-7cfa-3314-fe36-b8da4a25265d@linux.ibm.com>
 <BN9PR11MB5276CC29F17B87D14D1E61FF8CC49@BN9PR11MB5276.namprd11.prod.outlook.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>,
 "david@redhat.com" <david@redhat.com>,
 "imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "zhenyuw@linux.intel.com" <zhenyuw@linux.intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "pmorel@linux.ibm.com" <pmorel@linux.ibm.com>, "Christopherson, ,
 Sean" <seanjc@google.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Thu, 19 Jan 2023 03:43:36 +0000
"Tian, Kevin" <kevin.tian@intel.com> wrote:

> > From: Matthew Rosato <mjrosato@linux.ibm.com>
> > Sent: Wednesday, January 18, 2023 10:56 PM
> >=20
> > On 1/18/23 4:03 AM, Tian, Kevin wrote: =20
> > >> From: Alex Williamson
> > >> Sent: Wednesday, January 18, 2023 5:23 AM
> > >>
> > >> On Fri, 13 Jan 2023 19:03:51 -0500
> > >> Matthew Rosato <mjrosato@linux.ibm.com> wrote:
> > >> =20
> > >>>  void vfio_device_group_close(struct vfio_device *device)
> > >>>  {
> > >>> +=09void (*put_kvm)(struct kvm *kvm);
> > >>> +=09struct kvm *kvm;
> > >>> +
> > >>>  =09mutex_lock(&device->group->group_lock);
> > >>> +=09kvm =3D device->kvm;
> > >>> +=09put_kvm =3D device->put_kvm;
> > >>>  =09vfio_device_close(device, device->group->iommufd);
> > >>> +=09if (kvm =3D=3D device->kvm)
> > >>> +=09=09kvm =3D NULL; =20
> > >>
> > >> Hmm, so we're using whether the device->kvm pointer gets cleared in
> > >> last_close to detect whether we should put the kvm reference.  That'=
s a
> > >> bit obscure.  Our get and put is also asymmetric.
> > >>
> > >> Did we decide that we couldn't do this via a schedule_work() from th=
e
> > >> last_close function, ie. implementing our own version of an async pu=
t?
> > >> It seems like that potentially has a cleaner implementation, symmetr=
ic
> > >> call points, handling all the storing and clearing of kvm related
> > >> pointers within the get/put wrappers, passing only a vfio_device to =
the
> > >> put wrapper, using the "vfio_device_" prefix for both.  Potentially
> > >> we'd just want an unconditional flush outside of lock here for
> > >> deterministic release.
> > >>
> > >> What's the downside?  Thanks,
> > >> =20
> > >
> > > btw I guess this can be also fixed by Yi's work here:
> > >
> > > https://lore.kernel.org/kvm/20230117134942.101112-6-yi.l.liu@intel.co=
m/
> > >
> > > with set_kvm(NULL) moved to the release callback of kvm_vfio device,
> > > such circular lock dependency can be avoided too. =20
> >=20
> > Oh, interesting...  It seems to me that this would eliminate the report=
ed call
> > chain altogether:
> >=20
> > kvm_put_kvm =20
> >  -> kvm_destroy_vm
> >   -> kvm_destroy_devices
> >    -> kvm_vfio_destroy (starting here -- this would no longer be execut=
ed)
> >     -> kvm_vfio_file_set_kvm
> >      -> vfio_file_set_kvm
> >       -> group->group_lock/group_rwsem =20
> >=20
> > because kvm_destroy_devices now can't end up calling kvm_vfio_destroy
> > and friends, it won't try and acquire the group lock a 2nd time making =
a
> > kvm_put_kvm while the group lock is held OK to do.  The vfio_file_set_k=
vm
> > call will now always come from a separate thread of execution,
> > kvm_vfio_group_add, kvm_vfio_group_del or the release thread:
> >=20
> > kvm_device_release (where the group->group_lock would not be held since
> > vfio does not trigger closing of the kvm fd) =20
> >  -> kvm_vfio_destroy (or, kvm_vfio_release)
> >   -> kvm_vfio_file_set_kvm
> >    -> vfio_file_set_kvm
> >     -> group->group_lock/group_rwsem =20
>=20
> Yes, that's my point. If Alex/Jason are also OK with it probably Yi can
> send that patch separately as a fix to this issue. It's much simpler. =F0=
=9F=98=8A

If we can extract that flow separate from the cdev refactoring, ideally
something that matches the stable kernel backport rules, then that
sounds like the preferred solution.  Thanks,

Alex

