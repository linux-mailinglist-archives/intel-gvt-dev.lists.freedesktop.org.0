Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
X-Original-To: lists+intel-gvt-dev@lfdr.de
Delivered-To: lists+intel-gvt-dev@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 354476C3C5F
	for <lists+intel-gvt-dev@lfdr.de>; Tue, 21 Mar 2023 22:01:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8AA10E845;
	Tue, 21 Mar 2023 21:01:22 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86D110E832
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 21 Mar 2023 21:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679432478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I1KA6ZkpV3D+AmID9NMMP4J1e8acMfYHtrAK/R3ZyzU=;
 b=XtvB9CUfRCZR3Rse13JNe1bgq33/EgX7z/Rai8RrHHfDsujIpHtAqU22PfhOCFATG5POGi
 bkfgba72u3MbIc75BqLbQ3Z4jSC1TnT7dYaMo8SnZNmERk6mqtorVj3oiONqBvcpEjapO2
 lYLgAi6Gp2uYtomJ6qeJHJXtQ86X9iA=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-lZ6MvZw8OsKu425THmvtBg-1; Tue, 21 Mar 2023 17:01:15 -0400
X-MC-Unique: lZ6MvZw8OsKu425THmvtBg-1
Received: by mail-il1-f198.google.com with SMTP id
 n17-20020a056e02141100b003259a56715bso3041407ilo.15
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 21 Mar 2023 14:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679432475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I1KA6ZkpV3D+AmID9NMMP4J1e8acMfYHtrAK/R3ZyzU=;
 b=I43Uf0/luj9pJYwjaEMw97D0ywYqO5bsoQnBM8uUNw/l/7+3yGzawT73K33JheKI/Q
 9lyezzDywGHSKQWdbrD2NP7+kLYnv+LRnSZ5r5BSdRO+Tm83KyTCeG5MVK/oE8MCzp3q
 v5BGSp6UBnZig1hXmzhoWfK4Yraw1UkjvT1coG+e4tpivQxmdiG0HaAo6idG7yLR73rM
 36vBYrlI5Z2Xfr+ExdLXdaYh42RaxcGKJYuO4ib5Y3s+YfI2ioo4pIHrfoslLbqyZTJ5
 K/f5+1CAflIlg5la6uGfHxAUF9uaAEw3KWdffhDWodQgMJAgcVFsYxYfRvNtiCMYFngA
 301g==
X-Gm-Message-State: AO0yUKWiUwMpWY9RlJqeBwGz0fW5FVWwWJObvB1fjtnwS8Yhb98A4kuc
 wxbiS5pP/AiZtWc/xXJspw5a25cV3tk8hgzc7fiG0yjxM0xAW7yzl4KN/zf9cquMWIDg7KlI6tZ
 /RqYBRT33S+moKCakuxRMCFXFy2LW2baaIQ==
X-Received: by 2002:a92:cf44:0:b0:325:bab7:cb17 with SMTP id
 c4-20020a92cf44000000b00325bab7cb17mr267823ilr.24.1679432474776; 
 Tue, 21 Mar 2023 14:01:14 -0700 (PDT)
X-Google-Smtp-Source: AK7set/F7exqYQvOzCCmHLPB4uNfmmnepmhiUG7EPAgpEmj8wd8Iv128TRMF1l0+kK1w3FickMDApA==
X-Received: by 2002:a92:cf44:0:b0:325:bab7:cb17 with SMTP id
 c4-20020a92cf44000000b00325bab7cb17mr267805ilr.24.1679432474496; 
 Tue, 21 Mar 2023 14:01:14 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 q5-20020a056e02096500b003179ae2fb8fsm3892160ilt.2.2023.03.21.14.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 14:01:13 -0700 (PDT)
Date: Tue, 21 Mar 2023 15:01:12 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v6 12/24] vfio/pci: Allow passing zero-length fd array
 in VFIO_DEVICE_PCI_HOT_RESET
Message-ID: <20230321150112.1c482380.alex.williamson@redhat.com>
In-Reply-To: <ZBoYgNq60eDpV9Un@nvidia.com>
References: <BN9PR11MB5276300FCAAF8BF7B4E03BA48CBF9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20230316124532.30839a94.alex.williamson@redhat.com>
 <BN9PR11MB5276F7879E428080D2B214D98CBC9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20230316182256.6659bbbd.alex.williamson@redhat.com>
 <BN9PR11MB5276D5A71E43EA4CDD1C960A8CBD9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20230317091557.196638a6.alex.williamson@redhat.com>
 <ZBiUiEC8Xj9sOphr@nvidia.com>
 <20230320165217.5b1019a4.alex.williamson@redhat.com>
 <ZBjum1wQ1L2AIfhB@nvidia.com>
 <20230321143122.632f7e63.alex.williamson@redhat.com>
 <ZBoYgNq60eDpV9Un@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "Hao, 
 Xudong" <xudong.hao@intel.com>, "peterx@redhat.com" <peterx@redhat.com>, "Xu,
 Terrence" <terrence.xu@intel.com>,
 "chao.p.peng@linux.intel.com" <chao.p.peng@linux.intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "lulu@redhat.com" <lulu@redhat.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Zhao, Yan Y" <yan.y.zhao@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

On Tue, 21 Mar 2023 17:50:08 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Mar 21, 2023 at 02:31:22PM -0600, Alex Williamson wrote:
> 
> > This just seems like nit-picking that the API could have accomplished
> > this more concisely.  Probably that's true, but I think you've
> > identified a gap above that amplifies the issue.  If the user cannot
> > map BDFs to cdevs because the cdevs are passed as open fds to the user
> > driver, the _INFO results become meaningless and by removing the fds
> > array, that becomes the obvious choice that a user presented with this
> > dilemma would take.  We're skipping past easier to misuse, difficult to
> > use correctly, and circling around no obvious way to use correctly.  
> 
> No - this just isn't finished yet is all it means :(
> 
> I just noticed it just now, presumably Eric would have discovered this
> when he tried to implement the FD pass and we would have made a new
> _INFO at that point (or more ugly, have libvirt pass the BDF along
> with the FD).
> 
> > Unfortunately the _INFO ioctl does presume that userspace knows the BDF
> > to device mappings today, so if we are attempting to pre-enable a case
> > with cdev support where that is not the case, then there must be
> > something done with the _INFO ioctl to provide scope.  
> 
> Yes, something is required with _INFO before libvirt can use a FD
> pass. I'm thinking of a new _INFO query that returns the iommufd
> dev_ids for the reset group. Then qemu can match the dev_ids back to
> cdev FDs and thus vPCI devices and do what it needs to do.
> 
> But for the current qemu setup it will open cdev directly and it will
> know the BDF so it can still use the current _INFO.
> 
> Though it would be nice if qemu didn't need two implementations so Yi
> I'd rather see a new info in this series as well and qemu can just
> consistently use dev_id and never bdf in iommufd mode.

We also need to consider how libvirt determines if QEMU has the kernel
support it needs to pass file descriptors.  It'd be a lot cleaner if
this aligned with the introduction of vfio cdevs.
 
> Anyhow, I don't see the two topics as really related, the intention is
> not to discourage people from calling _INFO, it just to make the
> security proof simpler and more logical.

At a minimum, we need a new _INFO ioctl to get back to the point where
it's only a discussion of whether we're checking the user on scope.  We
can't remove the array while doing so opens up an obviously incorrect
solution to an impossible to use API.  Thanks,

Alex

